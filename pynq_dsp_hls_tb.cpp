#include "pynq_dsp_hls.h"

#include <iostream>
#include <vector>
#include <string>
#include <limits>
#include <cassert>
#include <cmath>

template<typename T, std::size_t S>
std::size_t array_len(const T (&)[S]) {
	return S;
}

// 期待出力と一致していたらtrueを返します
bool expect_eq(float dstL, float dstR, float expectL, float expectR) {
	const float e = std::numeric_limits<float>::epsilon();

	if (std::abs(dstL - expectL) >= e) {
		std::cout << "dstL != expectL: (" 
		          << dstL 
				  << " != "
				  << expectL
				  << " )"
				  << std::endl;
		return false;
	}
	if (std::abs(dstR - expectR) >= e) {
		std::cout << "dstR != expectR: ("
		          << dstL 
				  << " != "
				  << expectL
				  << " )"
				  << std::endl;
		return false;
	}
	return true;
}

// expect_eq_distortionの引数
typedef struct {
	float inL;
	float inR;
	float expectL;
	float expectR;
	float thresh;
} distortion_eq_args;
// distortionの入出力期待値が一致しているか確認します
bool expect_eq_distortion(distortion_eq_args args) {
	uint32_t config[EFFECT_CONFIG_SIZE] = {
		EffectId::DISTORTION,
		floatToRawBits(args.thresh),
	};
	SampleData inData = {
		args.inL,
		args.inR,
	};
	const SampleData dst = effect_distortion(inData, config);
	return expect_eq(dst.l, dst.r, args.expectL, args.expectR);
}

typedef struct {
	float inL;
	float inR;
	float expectL;
	float expectR;
	float thresh;
	float ratio;
} compressor_eq_args;
// compressorの入出力期待値が一致しているか確認します
bool expect_eq_compressor(compressor_eq_args args) {
	uint32_t config[EFFECT_CONFIG_SIZE] = {
		EffectId::COMPRESSOR,
		floatToRawBits(args.thresh),
		floatToRawBits(args.ratio),
	};
	SampleData inData = {
		args.inL,
		args.inR,
	};
	const SampleData dst = effect_compressor(inData, config);
	return expect_eq(dst.l, dst.r, args.expectL, args.expectR);
}

/**
 * @brief 期待値一致テストをします
 * 
 * @tparam T 
 * @param name 
 * @param test_func 
 * @param test_patterns 
 * @return true 
 * @return false 
 */
template<typename T>
bool tb_eq(const std::string name, bool (*test_func)(T), const std::vector<T>& test_patterns) {
	std::cout << "[" << name << "]: start" << std::endl;
	for (const T& p: test_patterns) {
		if (!test_func(p)) {
			std::cout << "[" << name << "]: failed" << std::endl;
			return false;
		}
	}
	std::cout << "[" << name << "]: pass " << test_patterns.size() << std::endl;
	return true;
}

const std::vector<distortion_eq_args> distortion_eq_patterns = {
	// inL, inR, expectL, expectR, thresh

	// 入力がなければそのまま
	{ 0, 0, 0, 0, 0,},
	{ 0, 0, 0, 0, 0.5,},
	{ 0, 0, 0, 0, 1.0,},
	// threshより小さい
	{ 0.2, 0.5, 0.2, 0.5, 1.0,},
	{ 0.2, 0.5, 0.2, 0.5, 0.5,},
	// 有効
	{ 0.2, 0.3, 0.2, 0.3, 0.3,},
	{ 0.2, 0.2, 0.2, 0.2, 0.2,},
	{ 0.1, 0.1, 0.1, 0.1, 0.1,},
	{ 0.0, 0.0, 0.0, 0.0, 0.0,},

	// 負数を設定されても絶対値扱いする
	{ 0.2, 0.3, 0.2, 0.3, -0.3,},
	{ 0.2, 0.2, 0.2, 0.2, -0.2,},
	{ 0.1, 0.1, 0.1, 0.1, -0.1,},

	// 入力値が負, threshより小さい
	{ -0.2,  0.5, -0.2,  0.5, 1.0,},
	{ -0.2,  0.5, -0.2,  0.5, 0.5,},
	{  0.2, -0.5,  0.2, -0.5, 1.0,},
	{  0.2, -0.5,  0.2, -0.5, 0.5,},
	// 入力値が負, 有効
	{ 0.2, -0.3, 0.2, -0.3,  0.3,},
	{ 0.2, -0.2, 0.2, -0.2,  0.2,},
	{ 0.1, -0.1, 0.1, -0.1, -0.1,},
	// 境界値
	{ 0.99, -0.99, 0.99, -0.99, 1.0,},
	{ 0.99, -0.99, 0.99, -0.99, 0.999,},
	{ 0.99, -0.99, 0.98, -0.98, 0.98,},
};

const std::vector<compressor_eq_args> compressor_eq_patterns = {
	// inL, inR, expectL, expectR, thresh, ratio

	// 入力値なし
	{ 0.0,  0.0,  0.0,  0.0, 0.0, 0.0,},
	{ 0.0,  0.0,  0.0,  0.0, 0.5, 0.0,},
	{ 0.0,  0.0,  0.0,  0.0, 0.5, 0.5,},
	{ 0.0,  0.0,  0.0,  0.0, 1.0, 0.5,},
	// threshより小さい
	{ 0.4, -0.3,  0.4, -0.3, 0.8, 0.5,},
	{-0.4,  0.3, -0.4,  0.3, 0.8, 0.5,},
	{ 0.5,  0.5,  0.5,  0.5, 0.5, 0.5,},
	{ 0.5,  0.5,  0.5,  0.5, 0.5, 0.5,},
	// 有効, ratio固定
	{ 0.7, -0.7,  0.6, -0.6, 0.5, 0.5,},
	{ 0.9, -0.9,  0.7, -0.7, 0.5, 0.5,},
	{ 0.9, -0.9,  0.5, -0.5, 0.1, 0.5,},
};


//Todo: テストが増えてきたらTest Driverを分離する?
int main(void) {
	if (!tb_eq("expect_eq_distortion", expect_eq_distortion, distortion_eq_patterns)) return 1;
	if (!tb_eq("expect_eq_compressor", expect_eq_compressor, compressor_eq_patterns)) return 1;

	return 0;
}
