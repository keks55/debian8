# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -l'
#
# Some more alias to avoid making mistakes:
# alias cp='cp -i'
# Reload bash
# source ~/.bashrc

alias aa="apt-get install"
alias pp="apt-get purge" 
alias uu="apt-get update"
alias ar="apt-get autoremove"
alias ll="ls -l"
alias dd="dpkg -i"

# nginx
alias nn="/etc/init.d/nginx restart"
alias nt="nginx -t"
#php
alias php5res="/etc/init.d/php5-fpm restart"
alias phpres="/etc/init.d/php7.1-fpm restart"
#mysql
alias mysqlres="/etc/init.d/mysql restart"
#network
alias nrs="/etc/init.d/networking restart"

# git 
alias ss='git status'
alias ff='git diff'
alias gl='git log'
alias show='git show'
# git add
alias add='git add'
alias ddd='git add .'
alias cc='git commit -m'
alias ppp='git push -u origin master'
# braches
alias bb='git branch'
alias ck='git checkout'
alias ckk='git checkout -b'
alias bbb='git push --set-upstream origin'
alias mm='git merge'
alias del='git branch -D'
alias delete='git push origin --delete'
# add only modified to git
alias addmod='git ls-files --modified | xargs git add'

#laravel
#export PATH="$PATH:~/.config/composer/vendor/bin"
export PATH="~/.composer/vendor/bin:$PATH" 
alias sss='php artisan serve'
alias pa='php artisan'
alias mmo='php artisan make:model'
alias mmi='php artisan make:migration'
alias mcc='php artisan make:controller'
alias migrate='php artisan migrate'
#
alias rrlist='php artisan route:list'
# stop port 8000
alias ttt='kill $(sudo lsof -t -i:8000)'

#programs
alias gg='geany'


#git remote add origin git@github.com:keks55/debian8.git
#git push -u origin master
