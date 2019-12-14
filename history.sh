# both must be set to enable history
export SAVEHIST=1000000
export HISTFILE=~/.zsh_history

# options
setopt extended_history        # record timestamp of command in HISTFILE
setopt hist_expire_dups_first  # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups        # ignore duplicated commands history list
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_reduce_blanks      # Remove superfluous blanks from each command line being added to the history list.
setopt hist_verify             # show command with history expansion to user before running it
setopt inc_append_history      # add commands to HISTFILE in order of execution
setopt inc_append_history_time # where possible, the history entry is written out to the file after the command is finished
setopt share_history           # share command history data
