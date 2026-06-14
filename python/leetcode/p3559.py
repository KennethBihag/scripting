from solution import Solution
from case import Case

EdgeList = list[list[int]]
QueryList = list[list[int]]
MaxOddList = list[int]

class Case3559(Case):
	_nextId: int = 0
	_ID: int = 3559

	@property
	def problemId(self):
		return Case3559._ID

	def __init__(self, input: tuple[EdgeList, QueryList], output: MaxOddList):
		super().__init__(input, output)

	@property
	def edges(self):
		return self._input[0]
	
	@property
	def queries(self):
		return self._input[1]
	
	@property
	def id(self):
		return self._id


class Solution3559(Solution):
	_id = 3559

	def EdgeLstToAdjSet(self, edges: list[list[int]]) -> dict[int, set[int]]:
		adjLst = dict()
		for i in range(1, len(edges)+2):
			adjLst[i] = set()
		for e in edges:
			adjLst[e[0]].add(e[1])
			adjLst[e[1]].add(e[0])
		return adjLst

	def assignEdgeWeights(self, edges: list[list[int]], queries: list[list[int]]) -> list[int]:
		ans = []
		eSet = self.EdgeLstToAdjSet(edges)
		for q in queries:
			if q[0]==q[1]:
				ans.append(0)
			else:
				lkpSet = set()
				a = self.getAnsPerQry(q[0], q[1], eSet, lkpSet)
				ans.append(pow(2,a-1))
		return ans

	def getAnsPerQry(self, fn: int, ln: int, edges: dict[int, set[int]], lkpSet: set[int]):
		lkpSet.add(fn)
		start: set[int] = edges[fn]
		start = start - lkpSet
		if ln in start:
			return len(lkpSet)
		for i in start:
			a = self.getAnsPerQry(i, ln, edges, lkpSet)
			if a > 0:
				return a
		lkpSet.remove(fn)
		return 0

	def Solve(self, cases: list[Case3559]) -> bool:
		self._SolveHelper()
		allPassed = True
		for c in cases:
			r = self.assignEdgeWeights(c.edges, c.queries)
			self._results.append(r)
			passed = c.output == r
			allPassed = allPassed and passed
			print(f'\tCase{c.id} passed? {passed}')
		return allPassed