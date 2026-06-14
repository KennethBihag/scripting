from case import Case
from p3559 import Case3559
from leetcode import leetcode

idCaseMap: dict[int, list[Case]] = {}

idCaseMap[3559] = []
edges = [[1,2],[1,3],[3,4],[3,5]]
queries = [[1,4],[3,4],[2,5]]
outputs = [2,1,4]
idCaseMap[3559].append( Case3559((edges, queries), outputs) )
edges = [[1,2]]
queries = [[1,1],[1,2]]
outputs = [0,1]
idCaseMap[3559].append( Case3559((edges, queries), outputs) )
del edges, queries, outputs

for k, (s, p) in leetcode.items():
	print(p)
	passed = s.Solve(idCaseMap[k])
	print(f'All passed? {passed}')
	print('---')