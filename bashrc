#=============================================================================#
#  ~/.bashrc - Marco Antonio Gomez   < marcogomez(at)aptscience.org >         #
#-----------------------------------------------------------------------------#
#                                                                             #
#  last modified in: 2010/08/12  11:08:32                                     #
#                                                                             #
#  This .bashrc that I use in my Mac OS, sets my fancy color prompt, some     #
#  aliases and my path so my scripts can be executed from anywhere            #
#=============================================================================#

# Adding ~/Code/Exec to my PATH environment variable
export PATH=${PATH}:~/Code/repository/scripts:~/Code/sandbox/scripts

# setting some variables that I use to make the PS1 export painless and clear
# from all that escape sequences crap
fck="\[\033[0;30;"
fcr="\[\033[0;31;"
fcg="\[\033[0;32;"
fcy="\[\033[0;33;"
fcb="\[\033[0;34;"
fcm="\[\033[0;35;"
fcc="\[\033[0;36;"
fcw="\[\033[0;37;"
fcK="\[\033[1;30;"
fcR="\[\033[1;31;"
fcG="\[\033[1;32;"
fcY="\[\033[1;33;"
fcB="\[\033[1;34;"
fcM="\[\033[1;35;"
fcC="\[\033[1;36;"
fcW="\[\033[1;37;"
bck="40m\]"
bcr="41m\]"
bcg="42m\]"
bcy="43m\]"
bcb="44m\]"
bcm="45m\]"
bcc="46m\]"
bcw="47m\]"
g1="\[\033[38;5;234m\]"
g2="\[\033[38;5;236m\]"
g3="\[\033[38;5;238m\]"

# setting up my fancy prompt [ bytes.sh is one of my scripts. It shows me
# right in the prompt the sum of all file sizes in the current directory,
# even the hidden ones. You can find bytes.sh code in my scripts repo ]
export PS1="$fcC$bcb[ $fcw$bcb\u $fcC$bcb@ $fcw$bcb\h $fcC$bcb]$fcB$bck[ $fcg$bck\w $fcW$bck($fcg$bck\$(bytes.sh) MB$fcW$bck) $g3>$g2>$g1> \[\033[m\]"

MACHINEOS=$(uname)
if [ $MACHINEOS == "Darwin" ]; then
	# making command line interface colorfull and setting my ls default colors
	export CLICOLOR=1
	export LSCOLORS="dxfxcxdxbxegedabagacad"
	# declaring some aliases
	alias ll="ls -hlG"
	alias la="ls -hlaG"
elif [ $MACHINEOS == "Linux" ]; then
	#declaring some aliases
	alias ll="ls -hl --color=auto"
	alias la="ls -lha --color=auto"
fi

# git related aliases
alias g='git status'
alias ungit="find . -name '.git' -exec rm -rf {} \;"
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gd='git diff'
alias gdm='git diff master'
alias gl='git pull'
alias gnp="git-notpushed"
alias gp='git push'
alias gst='git status'
alias gt='git status'
alias g='git status'
alias ga='git add'
alias gcl='git clean -x -f'
alias eg='vim .git/config'
alias gg='gitg &>/dev/null & disown'
alias gr='git reset'
alias grh='git reset --hard'
alias gs='git stash'
alias gsa='git stash apply'

