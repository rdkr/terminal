# prevent trying metadata service for auth
export AWS_METADATA_SERVICE_NUM_ATTEMPTS=0

# profile chooser
alias ax='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)'
