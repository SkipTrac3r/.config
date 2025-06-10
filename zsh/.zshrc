# -----------------------------------------------------------------------------
# 0. XDG Environment Setup (must be first!)
# -----------------------------------------------------------------------------
export ZDOTDIR="$HOME/.config/zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# -----------------------------------------------------------------------------
# 1. Powerlevel10k Instant Prompt (before anything interactive)
# -----------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------
# 2. Zsh History & Completion Cache
# -----------------------------------------------------------------------------
mkdir -p "$XDG_STATE_HOME/zsh" "$XDG_CACHE_HOME/zsh"

export HISTFILE="$XDG_STATE_HOME/zsh/history"

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# -----------------------------------------------------------------------------
# 3. Application-Specific XDG Environment Variables
# -----------------------------------------------------------------------------

# Azure CLI
export AZURE_CONFIG_DIR="$XDG_DATA_HOME/azure"

# Bash history (if used)
export HISTFILE="$XDG_STATE_HOME/bash/history"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Go
export GOPATH="$XDG_DATA_HOME/go"

# Maven
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"
# In your settings.xml, add:
# <localRepository>${env.XDG_CACHE_HOME}/maven/repository</localRepository>

# NPM
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME/npm/config/npm-init.js"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# SDKMAN
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"

# Java Preferences
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# Wget
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

# -----------------------------------------------------------------------------
# 4. Editor & PATH
# -----------------------------------------------------------------------------
export EDITOR=nvim
export VISUAL=nvim

export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"
export PATH="$PATH:/opt/maven/bin:$SDKMAN_DIR/candidates/java/17.0.14-tem/bin"

# -----------------------------------------------------------------------------
# 5. Oh My Zsh & Plugins
# -----------------------------------------------------------------------------
export ZSH="$XDG_DATA_HOME/oh-my-zsh"

# Load syntax highlighting before Oh My Zsh
source "$ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Additional completions
fpath+=("${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src")

plugins=(
  gitfast
  kubectl
  zsh-autosuggestions
  zsh-history-substring-search
)

source "$ZSH/oh-my-zsh.sh"

# -----------------------------------------------------------------------------
# 6. Prompt Configuration (Powerlevel10k)
# -----------------------------------------------------------------------------
[[ -f "${ZDOTDIR:-$HOME}/.p10k.zsh" ]] && source "${ZDOTDIR:-$HOME}/.p10k.zsh"

# -----------------------------------------------------------------------------
# 7. SDKMAN Init (Must be last)
# -----------------------------------------------------------------------------
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# -----------------------------------------------------------------------------
# 8. Zsh Options
# -----------------------------------------------------------------------------
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="%F{yellow}waiting on yer dumb ass...%f"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# -----------------------------------------------------------------------------
# 9. Aliases
# -----------------------------------------------------------------------------
alias vim=nvim
alias lg=lazygit
alias cls=clear
