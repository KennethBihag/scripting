# limiting info displayed
git log -2
git log --oneline
# # get author, hash, message title
git log --pretty=short
git log --format="Commit:%H, Author:%an, Title:%s"
# get last commit
# # simple
git log --reverse
# # get number from head
commitCount=$(git rev-list --count head)
git log head~$commitCount
# # count commits
git rev-list --count origin/master..head # count from..to
# # get n latest commits
git log head ^head~$n #or
git log ^head~$n head #or
git log head~3..head
