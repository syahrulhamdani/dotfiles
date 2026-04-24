# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# setting theme
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
SPACESHIP_TIME_SHOW="true"
SPACESHIP_GCLOUD_SHOW="false"
SPACESHIP_KUBECTL_SHOW="false"
SPACESHIP_KUBECTL_VERSION_SHOW="false"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ctags="`brew --prefix`/bin/ctags"
alias ptvim="poetry run vim"
alias uvim="uv run vim"

# docker command aliases
alias dps="docker ps --format '{{.Names}}'"
alias dpa="docker ps -a --format '{{.Names}}'"
alias dms="docker images --format 'table {{.Repository}}:{{.Tag}}\t{{.ID}}'"
alias dmd="docker images -f 'dangling=true' --format 'table {{.Repository}}:{{.Tag}}\t{{.ID}}'"
alias dmr="docker rmi"

# clean python related cache files
pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

export PYTHONPYCACHEPREFIX="${HOME}/.cache/Python"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="/Users/syahrulhamdani/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/syahrulhamdani/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/syahrulhamdani/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/syahrulhamdani/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/syahrulhamdani/google-cloud-sdk/completion.zsh.inc'; fi
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/syahrulhamdani/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by Windsurf
export PATH="/Users/syahrulhamdani/.codeium/windsurf/bin:$PATH"

# ngrok completion
if command -v ngrok &>/dev/null; then
eval "$(ngrok completion)"
fi

# pnpm
export PNPM_HOME="/Users/syahrulhamdani/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "/Users/syahrulhamdani/.deno/env"

# FZF configurations
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9,fg+:#f8f8f2,bg+:#44475a
  --color=hl+:#bd93f9,info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#ff9ed4,spinner:#ffb86c,header:#6272a4,border:#6272a4
  --color=gutter:#44475a
  --height 40% --layout=reverse --border
  --preview-window right:60%:wrap
  --preview 'bat --color=always --style=numbers --line-range :500 {1}'
  --bind 'ctrl-/:toggle-preview'
"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# fzf checkout branch
fco() {
  # 1. Get unique branch names (Short format)
  #    - refs/heads/ are local branches
  #    - refs/remotes/ are remote branches
  #    - We use %(refname:lstrip=2) to remove 'refs/heads/'
  #    - We use %(refname:lstrip=3) to remove 'refs/remotes/origin/'
  local branches=$(git for-each-ref --format='%(refname:short)' refs/heads/ refs/remotes/ | \
                   sed 's|^origin/||' | \
                   grep -v "HEAD" | \
                   sort -u)

  # 2. Run fzf
  local out=$(echo "$branches" | fzf \
    --query="$1" \
    --print-query \
    --header "ENTER: Checkout/Create | ESC: Cancel" \
    --preview 'git log --oneline --graph --color=always --count=10 {} 2>/dev/null || echo "New branch: {}"')

  # 3. Parse output
  local query=$(echo "$out" | head -1)
  local selection=$(echo "$out" | head -2 | tail -1)

  # Logic for checkout
  if [[ -n "$selection" && "$selection" != "$query" ]]; then
    # If it's a remote-only branch, git checkout will automatically
    # create a local tracking branch.
    git checkout "$selection"
  elif [[ -n "$query" ]]; then
    if echo "$branches" | grep -qx "$query"; then
      git checkout "$query"
    else
      echo -n "Branch '$query' not found. Create new branch? (y/n): "
      read -k 1 confirm
      echo
      if [[ "$confirm" =~ ^[Yy]$ ]]; then
        git checkout -b "$query"
      fi
    fi
  fi
}
fgb() {
    git branch | fzf --preview 'git show --color=always {-1}' \
                     --bind 'enter:become(git checkout {-1})' \
                     --height 40% --layout reverse
}
# fzf interactive git log
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --delimiter : \
      --preview 'bat --color=always --style=numbers --line-range :500 {1}' \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}
# fzf interactive git status
fgs() {
    # -m allows multi-select with Tab
    # --preview uses delta for beautiful diffs
    # awk '{print $NF}' extracts the filename from 'M  path/to/file.py'
    git status -s | fzf -m --ansi --nth 2..,.. \
        --preview 'git diff --color=always -- {-1} | delta --width=$COLUMNS' \
        --header "TAB: select | CTRL-S: toggle stage | ENTER: edit" \
        --bind "ctrl-s:execute(
            if git diff --cached --quiet -- {-1}; then
                git add {-1}
            else
                git reset -q -- {-1}
            fi
        )+reload(git status -s)" \
        --bind "enter:execute(vim {-1})"
}
# fzf interactive git diff + delta
fgdiff() {
    # Lists changed files; preview shows the diff through delta
    git diff --name-only | fzf -m --ansi \
        --preview 'git diff --color=always {} | delta --width=$COLUMNS' \
        --header "ENTER: edit | CTRL-D: view full diff" \
        --bind "enter:execute(vim {})" \
        --bind "ctrl-d:execute(git diff --color=always {} | less -R)"
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
. /opt/homebrew/etc/profile.d/z.sh
