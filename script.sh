proj=$(fzf < ~/.gcp-projects | awk '{print $2}')
service=$(fzf < ~/.gcp-services | awk '{print $NF}')
open $(echo $service | sed s/PROJECT/$proj/)
