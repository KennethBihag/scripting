# pushing to a newly created remote with no commits yet
# # the first commit is done locally then pushed
# # vars:
# #    nameOfRemote - usually 'origin'
# #    urlToRemote - in form of https://github.com/user/repo.git
git remote add $nameOfRemote $urlToRemote
git push -u $nameOfRemote $localBranch

# # when created new remote repos has one commit already but
# # local has none yet
git remote add $nameOfRemote $urlToRemote
git pull --set-upstream $nameOfRemote $localBranch

# deleting a remote branch
git push -d $nameOfRemote $branch
