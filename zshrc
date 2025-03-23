# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# source /home/msbis/Github/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

fpath+=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions/src
autoload -Uz compinit && compinit

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

# source ~/.local/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
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
#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################
# Alias's to change the directory
alias web='cd /var/www/html'

# Edit this .bashrc file
alias ebrc='ni ~/.bashrc'
alias ezrc='ni ~/.zshrc'
alias efrc='ni ~/.config/fish/config.fish'

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rms='rm -iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias c='clear'
alias lg='lazygit'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias gtc='git clone'
alias colorscheme='bash -c "$(wget -qO- https://git.io/vQgMr)"'
alias grep='grep --color=auto'
alias ni='nvim'
alias update-grub='sudo grub2-mkconfig -o "$(readlink -e /etc/grub2.cfg)"'
alias evrc='edit ~/.vimrc'
alias enrc='edit ~/.nanorc'
alias Logout='qdbus org.kde.ksmserver /KSMServer logout 1 0 3'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

alias le='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -luh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# special
alias ls='exa -hl --icons --color=always --group-directories-first'
alias ll='exa -hal --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias l='exa --icons --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'
alias lis='exa -1 --icons --color=always --group-directories-first'

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 664='chmod -R 664'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# SHA1
alias sha1='openssl sha1'
alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'
alias lookingglass="~/looking-glass-B5.0.1/client/build/looking-glass-client -F"
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# Use the best version of pico installed
edit() {
    if [ "$(type -t jpico)" = "file" ]; then
        # Use JOE text editor http://joe-editor.sourceforge.net/
        jpico -nonotice -linums -nobackups "$@"
    elif [ "$(type -t nano)" = "file" ]; then
        nano -c "$@"
    elif [ "$(type -t pico)" = "file" ]; then
        pico "$@"
    else
        nvim "$@"
    fi
}
sedit() {
    if [ "$(type -t jpico)" = "file" ]; then
        # Use JOE text editor http://joe-editor.sourceforge.net/
        sudo jpico -nonotice -linums -nobackups "$@"
    elif [ "$(type -t nano)" = "file" ]; then
        sudo nano -c "$@"
    elif [ "$(type -t pico)" = "file" ]; then
        sudo pico "$@"
    else
        sudo nvim "$@"
    fi
}

# Extracts any archive(s) (if unp isn't installed)
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
                *.tar.bz2) tar xvjf "$archive" ;;
                *.tar.gz) tar xvzf "$archive" ;;
                *.bz2) bunzip2 "$archive" ;;
                *.rar) rar x "$archive" ;;
                *.gz) gunzip "$archive" ;;
                *.tar) tar xvf "$archive" ;;
                *.tbz2) tar xvjf "$archive" ;;
                *.tgz) tar xvzf "$archive" ;;
                *.zip) unzip "$archive" ;;
                *.Z) uncompress "$archive" ;;
                *.7z) 7z x "$archive" ;;
                *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# Searches for text in all files in the current folder
ftext() {
    # -i case-insensitive
    # -I ignore binary files
    # -H causes filename to be printed
    # -r recursive search
    # -n causes line number to be printed
    # optional: -F treat search term as a literal, not a regular expression
    # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
    grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp() {
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
    awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

# Copy and go to the directory
cpg() {
if [ -d "$2" ]; then
    cp "$1" "$2" && cd "$2"
else
    cp "$1" "$2"
fi
}

# Move and go to the directory
mvg() {
if [ -d "$2" ]; then
    mv "$1" "$2" && cd "$2"
else
    mv "$1" "$2"
fi
}

# Create and go to the directory
mkdirg() {
mkdir -p "$1"
cd "$1"
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
local d=""
limit=$1
for ((i = 1; i <= limit; i++)); do
    d=$d/..
done
d=$(echo "$d" | sed 's/^\///')
if [ "$d" = "" ]; then
    d=..
fi
cd "$d"
}

# Automatically do an ls after each cd
cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && l
	else
		builtin cd ~ && l
	fi
}

# Returns the last 2 fields of the working directory
pwdtail() {
pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Show the current distribution
distribution() {
local dtype
# Assume unknown
dtype="unknown"

# First test against Fedora / RHEL / CentOS / generic Redhat derivative
if [ -r /etc/rc.d/init.d/functions ]; then
    source /etc/rc.d/init.d/functions
    [ zz"$(type -t passed 2>/dev/null)" == "zzfunction" ] && dtype="redhat"

    # Then test against SUSE (must be after Redhat,
    # I've seen rc.status on Ubuntu I think? TODO: Recheck that)
elif [ -r /etc/rc.status ]; then
    source /etc/rc.status
    [ zz"$(type -t rc_reset 2>/dev/null)" == "zzfunction" ] && dtype="suse"

    # Then test against Debian, Ubuntu and friends
elif [ -r /lib/lsb/init-functions ]; then
    source /lib/lsb/init-functions
    [ zz"$(type -t log_begin_msg 2>/dev/null)" == "zzfunction" ] && dtype="debian"

    # Then test against Gentoo
elif [ -r /etc/init.d/functions.sh ]; then
    source /etc/init.d/functions.sh
    [ zz"$(type -t ebegin 2>/dev/null)" == "zzfunction" ] && dtype="gentoo"

    # For Mandriva we currently just test if /etc/mandriva-release exists
    # and isn't empty (TODO: Find a better way :)
elif [ -s /etc/mandriva-release ]; then
    dtype="mandriva"

    # For Slackware we currently just test if /etc/slackware-version exists
elif [ -s /etc/slackware-version ]; then
    dtype="slackware"

fi
echo "$dtype"
}

# Show the current version of the operating system
ver() {
local dtype
dtype=$(distribution)

if [ "$dtype" == "redhat" ]; then
    if [ -s /etc/redhat-release ]; then
        cat /etc/redhat-release && uname -a
    else
        cat /etc/issue && uname -a
    fi
elif [ "$dtype" == "suse" ]; then
    cat /etc/SuSE-release
elif [ "$dtype" == "debian" ]; then
    lsb_release -a
    # sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
elif [ "$dtype" == "gentoo" ]; then
    cat /etc/gentoo-release
elif [ "$dtype" == "mandriva" ]; then
    cat /etc/mandriva-release
elif [ "$dtype" == "slackware" ]; then
    cat /etc/slackware-version
else
    if [ -s /etc/issue ]; then
        cat /etc/issue
    else
        echo "Error: Unknown distribution"
        exit 1
    fi
fi
}

# Automatically install the needed support files for this .bashrc file
install_bashrc_support() {
local dtype
dtype=$(distribution)

if [ "$dtype" == "redhat" ]; then
    sudo yum install multitail tree joe
elif [ "$dtype" == "suse" ]; then
    sudo zypper install multitail
    sudo zypper install tree
    sudo zypper install joe
elif [ "$dtype" == "debian" ]; then
    sudo apt-get install multitail tree joe
elif [ "$dtype" == "gentoo" ]; then
    sudo emerge multitail
    sudo emerge tree
    sudo emerge joe
elif [ "$dtype" == "mandriva" ]; then
    sudo urpmi multitail
    sudo urpmi tree
    sudo urpmi joe
elif [ "$dtype" == "slackware" ]; then
    echo "No install support for Slackware"
else
    echo "Unknown distribution"
fi
}

# Show current network information
netinfo() {
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
echo ""
/sbin/ifconfig | awk /'Bcast/ {print $3}'
echo ""
/sbin/ifconfig | awk /'inet addr/ {print $4}'

/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
echo "---------------------------------------------------"
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip() {
# Dumps a list of all IP addresses for every device
# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

# Internal IP Lookup
echo -n "Internal IP: "
/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

# External IP Lookup
echo -n "External IP: "
wget http://smart-ip.net/myip -O - -q
}

# View Apache logs
apachelog() {
if [ -f /etc/httpd/conf/httpd.conf ]; then
    cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
else
    cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
fi
}

# Edit the Apache configuration
apacheconfig() {
if [ -f /etc/httpd/conf/httpd.conf ]; then
    sedit /etc/httpd/conf/httpd.conf
elif [ -f /etc/apache2/apache2.conf ]; then
    sedit /etc/apache2/apache2.conf
else
    echo "Error: Apache config file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate httpd.conf && locate apache2.conf
fi
}

# Edit the PHP configuration file
phpconfig() {
if [ -f /etc/php.ini ]; then
    sedit /etc/php.ini
elif [ -f /etc/php/php.ini ]; then
    sedit /etc/php/php.ini
elif [ -f /etc/php5/php.ini ]; then
    sedit /etc/php5/php.ini
elif [ -f /usr/bin/php5/bin/php.ini ]; then
    sedit /usr/bin/php5/bin/php.ini
elif [ -f /etc/php5/apache2/php.ini ]; then
    sedit /etc/php5/apache2/php.ini
else
    echo "Error: php.ini file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate php.ini
fi
}

# Edit the MySQL configuration file
mysqlconfig() {
if [ -f /etc/my.cnf ]; then
    sedit /etc/my.cnf
elif [ -f /etc/mysql/my.cnf ]; then
    sedit /etc/mysql/my.cnf
elif [ -f /usr/local/etc/my.cnf ]; then
    sedit /usr/local/etc/my.cnf
elif [ -f /usr/bin/mysql/my.cnf ]; then
    sedit /usr/bin/mysql/my.cnf
elif [ -f ~/my.cnf ]; then
    sedit ~/my.cnf
elif [ -f ~/.my.cnf ]; then
    sedit ~/.my.cnf
else
    echo "Error: my.cnf file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate my.cnf
fi
}

# For some reason, rot13 pops up everywhere
rot13() {
if [ $# -eq 0 ]; then
    tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
else
    echo "$@" | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
fi
}

# Trim leading and trailing spaces (for scripts)
trim() {
local var=$@
var="${var#"${var%%[![:space:]]*}"}" # remove leading whitespace characters
var="${var%"${var##*[![:space:]]}"}" # remove trailing whitespace characters
echo -n "$var"
}
# GitHub Titus Additions

if [ -d "/var/lib/flatpak/exports/bin" ] ; then
    PATH="/var/lib/flatpak/exports/bin:$PATH"
fi

gac() {
git add .
git commit -m "$1"
}
lgac() {
git add .
git commit -m "$1"
git push
}
