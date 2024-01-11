source <(antibody init)
antibody bundle denysdovhan/spaceship-prompt

SPACESHIP_PROMPT_ORDER=(
  time
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  kubectl       # k8s
  aws           # aws
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_TIME_SHOW=true

SPACESHIP_KUBECTL_SHOW=false
SPACESHIP_KUBECTL_VERSION_SHOW=false

alias promptk8s='SPACESHIP_KUBECTL_SHOW=true'
