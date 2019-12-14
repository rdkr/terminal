# autocompelte from https://github.com/robbyrussell/oh-my-zsh/pull/8144/files

if [[ -z "${CLOUDSDK_HOME}" ]]; then
  search_locations=(
    "$HOME/google-cloud-sdk"
    "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
    "/usr/share/google-cloud-sdk"
    "/snap/google-cloud-sdk/current"
    "/usr/lib64/google-cloud-sdk/"
  )

  for gcloud_sdk_location in $search_locations; do
    if [[ -d "${gcloud_sdk_location}" ]]; then
      CLOUDSDK_HOME="${gcloud_sdk_location}"
      break
    fi
  done
fi

if (( ${+CLOUDSDK_HOME} )); then
  if ! type "${CLOUDSDK_HOME}/bin/gcloud" > /dev/null; then
    # Only source this if GCloud isn't already on the path
    source "${CLOUDSDK_HOME}/path.zsh.inc"
  fi
  source "${CLOUDSDK_HOME}/completion.zsh.inc"
  export CLOUDSDK_HOME
fi

### GCP Projects shell activation wrapper
## WORKFLOW
## List the projects you have access to
# gcloud projects list --account <email>
## Create a configuration
# gpcreate <account> <project>
## List configurations
# gplist
## Pick a configuration
# gpset <tab-tab>
## Logout
# gpclear
## Delete config
# gpdel <project>
# Set the project as iterm badge, env var and active gcloud configuration

function gpset {
  iterm2_set_user_var badge ${1}
  export CLOUDSDK_ACTIVE_CONFIG_NAME=${1}
}
function gpunset {
  iterm2_set_user_var badge ""
  unset CLOUDSDK_ACTIVE_CONFIG_NAME
}
function gpcreate {
  gcloud config configurations create ${1}
  gpset ${1}
  gcloud config set account ${2}
  gcloud config set project ${3}
  gcloud config configurations activate default
}
function gpdel {
  gpclear
  gcloud config configurations delete ${1}
}
function gplist {
  reply=($(gcloud config configurations list --format json | jq -r '.[].name'))
}
compctl -K gplist gpset gpdel

alias projects='gcloud projects list --format="table[no-heading](name, projectId)" | tee ~/.gcp-projects'
