#! /bin/bash
cd ~
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
bundle install
the_path_to_puma=$(which puma)
the_to_reddit="/home/appuser/reddit/"
the_path_to_script="/home/appuser/startpuma.sh"

tee $the_path_to_script <<EOF
#! /bin/bash
cd $the_path_to_reddit
$the_path_to_puma -d
EOF

sudo chmod +x $the_path_to_script

/home/appuser/./startpuma.sh