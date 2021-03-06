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

#### gcpui - to navigate to cloud console service pages from cli

function gcpui-update {
  echo "updating projects list..."
  gcloud projects list --format 'value(name,project_id)' | column -t > ~/.gcp-projects
}

function gcpui {
    base="https://console.cloud.google.com"
    project_input=$(fzf < ~/.gcp-projects | awk '{print $2}')
    project="?project=${project_input}"
    service=$(gcpui-services | fzf | awk '{print $NF}')
    echo "${base}${service}${project}"
    open "${base}${service}${project}"
    gcpui-update
}

function gcpui-services {
  cat << EOF
marketplace                                   /marketplace
billing                                       /billing
apis dashboard                                /apis/dashboard
apis library                                  /apis/library
apis credentials                              /apis/credentials
apis oauth                                    /apis/credentials/consent
apis domain                                   /apis/credentials/domainverification
apis page                                     /apis/agreements
appengine dashboard                           /appengine
appengine services                            /appengine/services
appengine versions                            /appengine/versions
appengine instances                           /appengine/instances
appengine task                                /appengine/taskqueues
appengine cron                                /appengine/cronjobs
appengine security                            /appengine/securityscan
appengine firewall                            /appengine/firewall
appengine quotas                              /appengine/quotadetails
appengine memcache                            /appengine/memcache
appengine search                              /appengine/search
appengine settings                            /appengine/settings
compute gce vms instances                     /compute/instances
compute gce instance groups migs              /compute/instancegroups/list
compute gce instance templates                /compute/instancetemplates/list
compute gce sole-tenant                       /compute/soletenancy
compute gce disks                             /compute/disks
compute gce snapshots                         /compute/snapshots
compute gce images                            /compute/images
compute gce tpus                              /compute/tpus
compute gce committed                         /compute/commitments
compute gce metadata                          /compute/metadata
compute gce health                            /compute/healthchecks
compute gce zones                             /compute/zones
compute gce network                           /compute/networkendpointgroups/list
compute gce operations                        /compute/operations
compute gce security                          /compute/securityscan
compute gce settings                          /compute/settings
k8s gke clusters                              /kubernetes/list
k8s gke workloads                             /kubernetes/workload
k8s gke services                              /kubernetes/discovery
k8s gke applications                          /kubernetes/application
k8s gke configuration                         /kubernetes/config
k8s gke storage                               /kubernetes/storage
k8s gke object                                /kubernetes/object/browser
functions                                     /functions
run                                           /run
bigtable                                      /bigtable
datastore entities                            /datastore/entities
datastore dashboard                           /datastore/stats
datastore indexes                             /datastore/indexes
datastore admin                               /datastore/settings
firestore data                                /firestore/data
firestore indexes                             /firestore/indexes/composite
filestore                                     /filestore
gcs browser                                   /storage/browser
gcs transfer                                  /storage/transfer
gcs transfer                                  /storage/transfers/on-premises
gcs transfer                                  /storage/transferappliance
gcs settings                                  /storage/settings
cloudsql                                      /sql
spanner                                       /spanner
memorystore                                   /memorystore
vpc dashboard                                 /networking/networks/list
vpc external ips addresses                    /networking/addresses/list
vpc firewall                                  /networking/firewalls/list
vpc routes                                    /networking/routes/list
vpc peering                                   /networking/peering/list
vpc shared                                    /networking/xpn
vpc connectors                                /networking/connectors
vpc packet                                    /networking/packetmirroring
net-services lbs                              /net-services/loadbalancing/list
net-services dns                              /net-services/dns
net-services cdn                              /net-services/cdn/list
net-services nat                              /net-services/nat/list
net-services director                         /net-services/trafficdirector/services/list
hybrid vpn                                    /hybrid/vpn/list
hybrid interconnect                           /hybrid/interconnects/list
hybrid cloud                                  /hybrid/routers/list
net-tier                                      /net-tier
net-security cloud armou                      /net-security/securitypolicies/list
net-security ssl policies                     /net-security/sslpolicies/list
net-intelligence network                      /net-intelligence/topology
net-intelligence connectivity                 /net-intelligence/connectivity
monitoringprojectproject monitoring           /monitoring
stackdriver dashboards                        /monitoring/dashboards
stackdriver metrics                           /monitoring/metrics-explorer
stackdriver alerting                          /monitoring/alerting
stackdriver uptime                            /monitoring/uptime
stackdriver groups                            /monitoring/groups
stackdriver settings                          /monitoring/settings
stackdriver debug                             /debug
stackdriver traces overview                   /traces/overview
stackdriver traces trace                      /traces/traces
stackdriver traces analysis                   /traces/tasks
stackdriver logs                              /logs
stackdriver logs based metrics                /logs/metrics
stackdriver logs exports                      /logs/exports
stackdriver logs resource                     /logs/usage
errorsprojectproject error                    /errors
profilerprojectproject profiler               /profiler
cloud-build dashboard                         /cloud-build/dashboard
cloud-build history                           /cloud-build/builds
cloud-build triggers                          /cloud-build/triggers
cloud-build settings                          /cloud-build/settings
cloudtasksprojectproject cloud                /cloudtasks
gcrprojectproject images                      /gcr
gcr settings                                  /gcr/settings
cloudschedulerprojectproject cloud            /cloudscheduler
dm deployments                                /dm/deployments
dm type                                       /dm/types
endpointsprojectproject services              /endpoints
endpoints developer                           /endpoints/portal
customer-identity providers                   /customer-identity/providers
customer-identity users                       /customer-identity/users
customer-identity settings                    /customer-identity/settings
customer-identity tenants                     /customer-identity/tenants
source.cloud.google.com source                https://source.cloud.google.com
catalogprojectproject private                 /catalog
composerprojectproject composer               /composer
dataproc clusters                             /dataproc/clusters
dataproc jobs                                 /dataproc/jobs
dataproc workflows                            /dataproc/workflows
cloudpubsub topics                            /cloudpubsub/topic
cloudpubsub subscriptions                     /cloudpubsub/subscription
cloudpubsub snapshots                         /cloudpubsub/snapshot
dataflowprojectproject dataflow               /dataflow
iotprojectproject iot                         /iot
bigqueryprojectproject bigquery               /bigquery
datacatalogprojectproject data                /datacatalog
dataprepprojectproject dataprep               /dataprep
data-fusionprojectproject data                /data-fusion
healthcare browser                            /healthcare/browser
healthcare marketplace                        /healthcare/marketplace
lifesciences pipelines                        /lifesciences/pipelines
lifesciences pipelines                        /lifesciences/genomics_pipelines
data-labeling data                            /data-labeling/datasets
data-labeling label                           /data-labeling/annotation-spec-sets
data-labeling instructions                    /data-labeling/instructions
ai-platform dashboard                         /ai-platform/dashboard
ai-platform ai                                /ai-platform/aihub-redirect
data-labelingprojectproject data              /data-labeling
ai-platform notebooks                         /ai-platform/notebooks
ai-platform jobs                              /ai-platform/jobs
ai-platform models                            /ai-platform/models
natural-languageprojectproject natural        /natural-language
recommendationprojectproject recommendations  /recommendation
automl-tables data                            /automl-tables/datasets
automl-tables models                          /automl-tables/models
talent-solution overview                      /talent-solution/overview
talent-solution client                        /talent-solution/behavioral-livestream
talent-solution client                        /talent-solution/behavioral-search
talent-solution job                           /talent-solution/export-jobs
talent-solution service                       /talent-solution/service-account-connections
translation dashboard                         /translation/dashboard
translation datasets                          /translation/datasets
translation models                            /translation/models
vision dashboard                              /vision/dashboard
vision datasets                               /vision/datasets
vision models                                 /vision/models
video-intelligenceprojectproject video        /video-intelligence
google overview                               /google/maps-apis/overview
google apis                                   /google/maps-apis/api-list
google metrics                                /google/maps-apis/metrics
google quotas                                 /google/maps-apis/quotas
google credentials                            /google/maps-apis/credentials
google support                                /google/maps-apis/support
marketplace cloud                             /marketplace/details/endpoints/prod.cloud.datastax.com
marketplace mongodb                           /marketplace/details/mongodb/atlas-pro
EOF
}
