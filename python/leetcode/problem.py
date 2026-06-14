from enum import Enum


class Difficulty(Enum):
	EASY = -1
	MEDIUM = 0
	HARD = 1


class Problem:
	_id: int
	_url: str
	_title: str
	_diff: Difficulty

	@property
	def Id(self):
		return self._id

	def __init__(self, problem_id: int, title: str, url: str, diff: Difficulty):
		self._id = problem_id
		self._url = url
		self._title = title
		self._diff = diff

	def __str__(self):
		return (
			f'Leetcode Problem #{self._id}:\n'
			f' "{self._title}" in\n'
			f' "{self._url}"\n'
			f' is {self._diff.name.lower()}.'
		)