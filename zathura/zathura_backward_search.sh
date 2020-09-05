#!/bin/bash

ACTIVEWINDOW=$(xdotool getactivewindow)
eval $(xdotool getwindowgeometry --shell $ACTIVEWINDOW)

HALF_WIDTH="$(($WIDTH / 2 + 10))"
HALF_HEIGHT="$(($HEIGHT / 2))"

xdotool mousemove --window $ACTIVEWINDOW $HALF_WIDTH $HALF_HEIGHT keydown ctrl click 1 keyup ctrl
