export LANG=zh_CN.utf8
export LC_ALL=zh_CN.utf8
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx 
export QT_IM_MODULE=fcitx
eval `dbus-launch --sh-syntax --exit-with-session`
exec musca
