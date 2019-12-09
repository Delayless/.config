killall -q polybar
 
while pgrep -u $UID -x polybar >/dev/null; do sleep 0; done
 
polybar bar1
