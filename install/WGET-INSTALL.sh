#!/bin.sh

rm -rf /tmp/glacier && cd /tmp && git clone https://github.com/everest-linux/glacier && cd glacier/install && chmod +x INSTALL-GLACIER.sh && sudo ./INSTALL-GLACIER.sh
