# amending authorship
# # use current author
git commit --amend --reset-author
# # use any author
git commit --amend --author='authName <authEmail>'
# or
git reset --soft head~1
git commit --author="authName <authEmail>"
