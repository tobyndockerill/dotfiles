# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="pure"
# ZSH_THEME="hyperzsh"

ZSH_THEME="spaceship"
SPACESHIP_VI_MODE_SHOW=false

# ZSH_THEME="geometry"
# ZSH_THEME="gitster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/zsh/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast bundler common-aliases rails history-substring-search tmux tmuxinator vi-mode
  colored-man-pages)
if [ $OSTYPE=="darwin*" ]; then
  plugins+=(brew heroku osx)
fi

# User configuration

path=($HOME'/.rbenv/shims')
path+=($HOME'/.rbenv/bin')
path+=('/usr/local/var/rbenv/shims')
path+=('/usr/local/bin/git')
path+=($HOME'/dotfiles/bin')
path+=('/usr/local/bin')
path+=('/usr/local/sbin')
path+=('/usr/bin')
path+=('/bin')
path+=('/usr/sbin')
path+=('/sbin')
path+=('/opt/X11/bin')
path+=('/usr/local/opt/go/libexec/bin')

export PATH
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:$(yarn global bin)

source $ZSH/oh-my-zsh.sh

[ -f $HOME/dotfiles/.zshrc-private ] && source $HOME/dotfiles/.zshrc-private

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="nvim"
alias v.="nvim ."
unalias rg

# Allow RBENV to control ruby version
eval "$(rbenv init -)"

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh ]

# Traverse back to home containing .git in directory tree
function cdg() {
  while [[ $PWD != '/' && ! -d ".git" ]]; do cd ..; done
}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="/Users/tobyn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
