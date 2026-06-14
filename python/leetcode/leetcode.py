from p3559 import *
from problem import *


leetcode: dict[int, tuple[Solution, Problem]] = {}

leetcode[3559] = (
	Solution3559(),
	Problem(
		3559,
		'Number of Ways to Assign Edge Weights II',
		'https://leetcode.com/problems/number-of-ways-to-assign-edge-weights-ii/description/',
		Difficulty.HARD )
)