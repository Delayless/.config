#!/bin/bash
 
GITPROXY="https://ghproxy.com/"
# st
git clone ${GITPROXY}https://github.com/Delayless/st ~/Projects/Delayless/

cd ~/Projects/Delayless/st/
sudo make clean install

