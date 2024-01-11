function engie {
  secret engie
  podman run -it --rm  \
    -e OKTA_PASSWORD=$OKTA_PASSWORD \
    -v ~/.aws/credentials:/root/.aws/credentials \
    -v ~/.okta_aws_login_config:/root/.okta_aws_login_config \
    mdu42/gimme-aws-creds --profile ENGIE
  unset OKTA_PASSWORD
  export AWS_PROFILE=ENGIE
}
