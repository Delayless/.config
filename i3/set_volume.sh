#!/bin/bash
# DEFAULT_SINK_NAME=$(pactl info | awk -F": " '/^Default Sink: /{print $2}')
DEFAULT_SINK_NAME=$(pactl list sinks | awk '$2=="RUNNING"{getline; print $2;}')
SINK_INDEX=$(pactl list short | grep RUNNING | sed -e 's/^\([0-9][0-9]*\)[^0-9].*/\1/')
RUNNING_SINK_CURRENT_VOLUME=$(pactl list sinks | awk '/^\sVolume:/{i++} i=='$(($SINK_INDEX+1))'{print $5; exit}')
# yes/no
MUTE_STATUS=$(pactl list sinks | awk '/^\sMute:/{i++} i=='$(($SINK_INDEX+1))'{print $2; exit}')

case $1 in
    '--toggle')
        pactl set-sink-mute $DEFAULT_SINK_NAME toggle # mute sound
        ;;
    '--up')
        pactl set-sink-mute $DEFAULT_SINK_NAME 0 # mute sound
        pactl set-sink-volume $DEFAULT_SINK_NAME +5%  # increase sound volume
        ;;
    '--down')
        pactl set-sink-volume $DEFAULT_SINK_NAME -5%  # decrease sound volume
        ;;
    '--get-volume')
        if [[ $MUTE_STATUS == 'yes' ]]; then
            # echo "🔇"
            echo "✖"
        else
            echo $RUNNING_SINK_CURRENT_VOLUME
        fi
        ;;
    *)
        echo "Please input --option(--toggle/up/down)"
esac

