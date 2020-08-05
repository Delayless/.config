#!/bin/bash

# Get id of touchpad and the id of the field corresponding to
# tapping to click
# Laptop Touchpad
Touchpad_id=`xinput list | grep "Touchpad" | cut -d'=' -f2 | cut -d'[' -f1`
# Apple Magic Trackpad
Trackpad_id=`xinput list | grep "Trackpad" | cut -d'=' -f2 | cut -d'[' -f1`
tap_to_click_Touchpad_id=`xinput list-props $Touchpad_id \
                      | grep "Tapping Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
tap_to_click_Trackpad_id=`xinput list-props $Trackpad_id \
                      | grep "Tapping Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`

# Set the property to true
xinput --set-prop $Touchpad_id $tap_to_click_Touchpad_id 1
xinput --set-prop $Trackpad_id $tap_to_click_Trackpad_id 1
