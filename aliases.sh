alias runner='ssh localhost -i ~/.ssh/google_compute_engine -p 2222 -o StrictHostKeyChecking=no'
alias k8sadmin='kubectl create clusterrolebinding cluster-admin-binding-$(whoami) --clusterrole=cluster-admin --user=$(gcloud config get-value account)'
alias reload='source ~/.zshrc'
alias zshrc='code ~/.terminal/'
alias tf='terraform'

function today {
  echo "$(date +'%Y-%m-%d %H:%m') $@" >> $HOME/today.log
}

function yday {
  cat $HOME/today.log | grep $(tail $HOME/today.log -n 1 | cut -c 1-10) | cut -c 12-
}
