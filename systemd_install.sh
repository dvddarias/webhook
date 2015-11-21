name="webhook"
shot_desc="Webhook"
desc="A simple webhook written in Go."

user="$(whoami)" #the user name that will run the script
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #get the bash script directory
run="$dir/$name"
opts="-port 9000 -hooks hooks.json -verbose"

if [ $# -eq 1 ]
then
	if [ "$1" = "-u" ]
	then
		sudo systemctl stop $name
		sudo rm /etc/systemd/$name.service
		exit
	fi
fi

service="[Unit]
Description=$desc
After=syslog.target
After=network.target

[Service]
Type=simple
User=$user
WorkingDirectory=$dir
ExecStart=$run $opts
Restart=always

[Install]
WantedBy=multi-user.target
"

printf "$service" > /tmp/$name.service
sudo mv /tmp/$name.service /etc/systemd/$name.service
sudo systemctl start $name
