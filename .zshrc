# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"
export ZSH_CUSTOM="/usr/share/zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="agnoster"
ZSH_THEME="../zsh-theme-powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	ruby
	autojump
	zsh-syntax-highlighting
	zsh-autosuggestions
	zsh-completions
	history-substring-search
	fzf
	vi-mode
)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

n ()
{
	# Block nesting of nnn in subshells
	if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
		echo "nnn is already running"
		return
	fi

	# The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
	# To cd on quit only on ^G, remove the "export" as in:
	#     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	# NOTE: NNN_TMPFILE is fixed, should not be modified

	# ONLY 1 OF THE FOLLOWING LINES CAN BE UNCOMMENTED AT A TIME
	# Uncomment so cd on quit activates on all exits not just ^G
	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	# Uncomment so it only works with ^G
	# NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

	# Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
	# stty start undef
	# stty stop undef
	# stty lwrap undef
	# stty lnext undef

	nnn "$@"

	if [ -f "$NNN_TMPFILE" ]; then
		. "$NNN_TMPFILE"
		rm -f "$NNN_TMPFILE" > /dev/null
	fi
}

function countdown(){
	date1=$((`date +%s` + $1));
	while [ "$date1" -ge `date +%s` ]; do
		echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
		sleep 0.1
	done
}

function stopwatch(){
	date1=`date +%s`;
	while true; do
		echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
		sleep 0.1
	done
}

alias v='nvim'
alias math='ipython --profile=solom'
alias fdisk='sudo fdisk -l'
alias iotop='sudo iotop'
alias ls='exa -l -a --color=always --icons'
alias l='exa -l --color=always'
alias s='devour'
alias getIP='curl ipconfig.io'
alias weather='curl wttr.in/Cairo'
alias nnn='nnn -e -d'
alias n='n -e -d -R'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cat='bat'
alias less='bat'
alias c='clear'
alias dmesg='dmesg --color=always'

export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin:/opt/cuda/nsight_compute:/opt/cuda/nsight_systems/bin"
export QT_QPA_PLATFORMTHEME=qt5ct
export NNN_PLUG="o:fzopen;c:fzcd;j:jump;p:preview-tui;i:preview-tabbed;d:dragdrop;r:renamer"
export NNN_BMS="a:/mnt/Abdo/Abdo/Abdos University work;m:/mnt;t:/mnt/tank;r:/mnt/ramdisk;M:/mnt/tank/media;A:/mnt/Abdo/Abdo/Abdos University work/Spring 2021;R:/mnt/Abdo/Abdo/Abdos University work/spring 2020/Research;h:/home/solom;/:/"

typeset -A key
key=(
	BackSpace  "${terminfo[kbs]}"
	Home       "${terminfo[khome]}"
	End        "${terminfo[kend]}"
	Insert     "${terminfo[kich1]}"
	Delete     "${terminfo[kdch1]}"
	Up         "${terminfo[kcuu1]}"
	Down       "${terminfo[kcud1]}"
	Left       "${terminfo[kcub1]}"
	Right      "${terminfo[kcuf1]}"
	PageUp     "${terminfo[kpp]}"
	PageDown   "${terminfo[knp]}"
)

# Setup key accordingly
[[ -n "${key[BackSpace]}" ]] && bindkey "${key[BackSpace]}" backward-delete-char
[[ -n "${key[Home]}"      ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}"    ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}"        ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[PageUp]}"    ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Home]}"      ]] && bindkey -M vicmd "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -M vicmd "${key[End]}" end-of-line
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

#set --export NNN_FIFO "/tmp/nnn.fifo"
export NNN_FIFO="/tmp/nnn.fifo"

ramdisk() {
	if [ -n "$1"]
	then
		sudo mount -t tmpfs -o size="$1"M tmpfs /mnt/ramdisk
	else
		sudo mount -t tmpfs -o size=81928M tmpfs /mnt/ramdisk
	fi
}

searchPDF() {
	find ./ -name '*.pdf' -exec sh -c "pdftotext '{}' - | grep --with-filename --label='{}' --color '$1'" \;
}


htop() {
	TERMTEMP="$TERM"
	TERM="xterm-256color"
	/bin/htop "$@"
	TERM="$TERMTEMP"
}

mkcd() {
	mkdir -p "$1"
	cd "$1"
}

swapF() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

C() {
	cd ~/
	clear
}

cheat() {
	curl cheat.sh/"$@"
}

m() {
	python -c "print($@)"
}

fortune

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
