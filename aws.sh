function engie {
  eval $(op signin my)
  docker run -it --rm  \
    -e OKTA_PASSWORD=$(op get item 77ertfv67we4yrrhlz6soqwofm --fields password) \
    -v ~/.aws/credentials:/root/.aws/credentials \
    -v ~/.okta_aws_login_config:/root/.okta_aws_login_config \
    mdu42/gimme-aws-creds --profile ENGIE
  export AWS_PROFILE=ENGIE
}

# in ~/AWS.sh:
# export AWS_ACCESS_KEY_ID=''
# export AWS_SECRET_ACCESS_KEY=''
# export AWS_DEFAULT_REGION=''

# function aws {
#     # set -o errexit
#     set -o nounset
#     set -o pipefail

#     # enable interruption signal handling
#     trap - INT TERM

#     source ~/AWS.sh

#     docker run --rm \
#         -t $(tty &>/dev/null && echo "-i") \
#         -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
#         -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
#         -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
#         -v "$(pwd):/project" \
#         mesosphere/aws-cli \
#         "$@"
# }

# aws(){
# 	docker run -it --rm \
# 		-v "${HOME}/.aws:/root/.aws" \
#         -v "$(pwd):/project" \
# 		--log-driver none \
# 		--name aws \
# 		${DOCKER_REPO_PREFIX}/awscli "$@"
# }

# complete -C $(which aws_completer) aws
