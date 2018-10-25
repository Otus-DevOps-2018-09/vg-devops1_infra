#! /bin/bash
set -e
cd ~
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
bundle install
the_path_to_puma=$(which puma)
the_path_to_reddit="/home/appuser/reddit/"
the_path_to_script="/home/appuser/startpuma.sh"

tee $the_path_to_script <<EOF
#! /bin/bash
cd /home/appuser/reddit/
$the_path_to_puma -d
EOF

sudo chmod +x $the_path_to_script

sudo tee /etc/systemd/system/mypuma.service <<EOF
[Unit]
Description=Puma Service
Requires=network-online.target
After=network-online.target

[Service]
User=appuser
RemainAfterExit=yes
ExecStart=$the_path_to_script

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable mypuma.service