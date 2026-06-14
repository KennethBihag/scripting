from abc import ABC, abstractmethod
from case import Case

class Solution(ABC):
	def __init__(self):
		self._results = []

	@abstractmethod
	def Solve(self, cases: list[Case]) -> bool:
		pass

	def _SolveHelper(self):
		self._results.clear()
		print(f'Solving problem #{type(self)._id}')

	def GetResults(self):
		return self._results