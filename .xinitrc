export LANG="zh_CN.utf8"
export LC_ALL="zh_CN.utf8"
export XMODIFIERS="@im=fcitx"
export XIM="fcitx"
export GTK_IM_MODULE="xim"
export QT_IM_MODULE="xim"
eval `dbus-launch --sh-syntax --exit-with-session`
xkbset m
xkbset exp =m
exec musca
