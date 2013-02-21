PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin
SHELL=/bin/bash
MANPATH=/usr/man:/usr/X11/man
EDITOR=/usr/bin/vim
export EDITOR
FCEDIT=/usr/bin/vim
#`echo $- | grep -qs i` && byobu-launcher && exit 0

export GOROOT=/home/solos/dev/go
export PATH=$PATH:$GOROOT/bin

LC_ALL=zh_CN.UTF8

xmodmap /home/solos/.xmodmap
