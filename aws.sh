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
