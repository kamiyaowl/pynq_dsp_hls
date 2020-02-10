#include "pynq_dsp_hls.h"

#include <iostream>
#include <vector>
#include <cassert>

template<typename T, std::size_t S>
std::size_t array_len(const T (&)[S]) {
	return S;
}

// 期待出力と一致していたらtrueを返します
bool expect_eq(float dstL, float dstR, float expectL, float expectR) {
	if (dstL != expectL) {
		std::cout << "dstL != expectL: (" 
		          << dstL 
				  << " != "
				  << expectL
				  << " )"
				  << std::endl;
		return false;
	}
	if (dstR != expectR) {
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

// distortionの入出力期待値が一致しているか確認します
bool expect_eq_distortion(float inL, float inR, float thresh, float expectL, float expectR) {
	uint32_t config[EFFECT_CONFIG_SIZE] = {
		EffectId::DISTORTION,
		floatToRawBits(thresh),
	};
	SampleData inData = {
		inL,
		inR,
	};
	const SampleData dst = effect_distortion(inData, config);
	return expect_eq(dst.l, dst.r, expectL, expectR);
}

bool tb_distortion(void) {
	typedef struct {
		float inL;
		float inR;
		float expectL;
		float expectR;
		float thresh;
	} distortion_test_pattern;

	const std::vector<distortion_test_pattern> test_patterns = {
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

	std::cout << "[expect_eq_distortion]: start" << std::endl;
	for (const distortion_test_pattern& p: test_patterns) {
		if (!expect_eq_distortion(p.inL, p.inR, p.thresh, p.expectL, p.expectR)) {
			std::cout << "[expect_eq_distortion]: failed" << std::endl;
			return false;
		}
	}
	std::cout << "[expect_eq_distortion]: pass " << test_patterns.size() << std::endl;
	return true;
}

int main(void) {
	if (!tb_distortion()) return 1;

	return 0;
}
