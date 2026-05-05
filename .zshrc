# ----------------------------
# PATH
# ----------------------------

autoload -U colors

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# HomeBrew path for Linux
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
# HomeBrew path for Mac 
# eval "$(/opt/homebrew/bin/brew shellenv)"

# ----------------------------
# HISTORY
# ----------------------------

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/.zsh_history"
HISTDUP=erase

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups

# ----------------------------
# SHELL BEHAVIOR
# ----------------------------

# for better navigation
# setopt AUTO_CD
# setopt CORRECT

# ----------------------------
# STARSHIP PROMPT
# ----------------------------
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n node (https://github.com/tj/n)


# ----------------------------
# ALIASES (open as needed)
# ----------------------------
alias -g la='ls -a --color'
alias -g C=' xclip -selection clipboard'
alias -g V='xclip -o'
alias -g mkdirvu='mkdir normal/question normal/solution practical-lab/question practical-lab/solution -p'

# alias ll="ls -la"
# alias la="ls -A"
# alias l="ls -CF"

# ----------------------------
# PLUGINS
# ----------------------------
setopt interactivecomments

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/zsh_plugins/zsh-you-should-use/you-should-use.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh # great
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh # slows terminal

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # gray suggestions
# source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh


# setting for zsh-syntax-highlighting
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# ----------------------------
# KEYBINDINGS (Quality of Life)
# ----------------------------

# Better ctrl-r search (uses built-in history search)
# bindkey '^R' history-incremental-search-backward

# Fix delete key issues (cross-platform)
bindkey '^[[3~' delete-char

# Edit prompt line in vim with ctrl + e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# keyboard shortcut to git commit
bindkey -s '^Xgc' 'git commit -m ""\C-b'

# ----------------------------
# CUSTOM WORKFLOW
# ----------------------------

gh() {
  local branch msg

  branch=$(git branch --show-current 2>/dev/null) || return
  msg=${1:-"default msg"}

  git add .
  git diff --cached --quiet && { echo "Nothing to commit"; return; }

  git commit -m "$msg" || return
  git push origin "$branch"
}

# copy current command to clipboard
copy-command () {
  echo -n $BUFFER | C
  zle -M "Copied to clipboard"
}
zle -N copy-command
bindkey '^Xc' copy-command

# clear screen, keep buffer (not working i guess)
clear-keep-buffer () {
   zle clear-screen
}
zle -N clear-keep-buffer
bindkey '^Xl' clear-keep-buffer
