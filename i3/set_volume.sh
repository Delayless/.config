#!/bin/bash
# It's not working(when it's suspend the video, the device isn't RUNNING)
# But this statement can be referenced(getline to get next line).
# DEFAULT_SINK_NAME=$(pactl list sinks | awk '$2=="RUNNING"{getline; print $2;}')

SINK_INDEX=$(pacmd list-sinks | awk '/index:/{i++} /* index:/{print i; exit}')
DEFAULT_SINK_NAME=$(pacmd stat | awk -F": " '/^Default sink name: /{print $2}')
DEFAULT_SINK_VOLUME=$(pacmd list-sinks |
        awk '/^\s+name: /{indefault = $2 == "<'$DEFAULT_SINK_NAME'>"}
            /^\s+volume: / && indefault {print $5; exit}')
# yes/no
MUTE_STATUS=$(pacmd list-sinks | awk '/^\smuted:/{i++} i=='$SINK_INDEX'{print $2; exit}')

case $1 in
    '--toggle')
        echo $DEFAULT_SINK_NAME
        pactl set-sink-mute $DEFAULT_SINK_NAME toggle # mute sound
        ;;
    '--up')
        if [[ $MUTE_STATUS == 'yes' ]];then
            pactl set-sink-volume $DEFAULT_SINK_NAME 35%
            pactl set-sink-mute $DEFAULT_SINK_NAME 0 # unmute sound
        fi
        pactl set-sink-volume $DEFAULT_SINK_NAME +5%  # increase sound volume
        ;;
    '--down')
        pactl set-sink-volume $DEFAULT_SINK_NAME -5%  # decrease sound volume
        ;;
    +[0-9]*%)
        if [[ $MUTE_STATUS == 'yes' ]];then
            pactl set-sink-volume $DEFAULT_SINK_NAME 35%
            pactl set-sink-mute $DEFAULT_SINK_NAME 0 # unmute sound
        fi
        pactl set-sink-volume $DEFAULT_SINK_NAME $1  # increase sound volume
        ;;
    -[0-9]*%)
        pactl set-sink-volume $DEFAULT_SINK_NAME $1  # decrease sound volume
        ;;
    [0-9]*%)
        pactl set-sink-volume $DEFAULT_SINK_NAME $1  # set volume
        ;;
    '--get-volume')
        if [[ $MUTE_STATUS == 'yes' ]]; then
            # echo "🔇"
            echo "✖"
        else
            echo $DEFAULT_SINK_VOLUME
        fi
        ;;
    *)
        echo "Please input --option(--toggle/up/down/get-volume or +5%/-5%/50%)"
esac

