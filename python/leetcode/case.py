from abc import ABC, abstractmethod


class Case(ABC):
	@property
	@abstractmethod
	def problemId(self):
		pass

	def __init__(self, input, output):
		self._input = input
		self._output = output
		type(self)._nextId += 1
		self._id = type(self)._nextId

	@property
	def output(self):
		return self._output