# Practice for configuring git for the user

# get all from any config file
git config --show-scope --get-all user.name
git config --show-origin --get-all user.email
# replace a value
: '
git config --local --unset user.name
git config --local --add user.name NEW_USER_NAME
'
# set desired text editor for commits
git config --global --add core.editor notepad
