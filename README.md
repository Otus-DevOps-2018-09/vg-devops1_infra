# vg-devops1_infra
vg-devops1 Infra repository 

Task No: 3 

The modern and secure way of connecting to the remote host behind bastion server is to use ProxyCommand. The working solution that I found for my IP addresses was ssh -o ProxyCommand='ssh -i ~/.ssh/appuser -W %h:%p appuser@35.210.209.239' appuser@10.132.0.3

To connect via alias like ssh someinternalhost, I modified ~/.ssh/config file like

Host bastion HostName 35.210.209.239 User appuser IdentityFile ~/.ssh/appuser ProxyCommand none

Host someinernalhost HostName 10.132.0.3 User appuser IdentityFile ~/.ssh/appuser ProxyCommand ssh bastion -W %h:%p appuser@35.210.209.239

The Pritunl server was successfully installed. I've also installed open source Printunl OpenVPN client via https://client.pritunl.com/

While connecting to VPN, an additional tun/virtual interface was created in the server machine. The IP address of this interface is 192.168.237.1. The client also creates on my machine a similar interface with IP address 192.168.237.1 (temporary)

bastion_IP = 35.210.209.239 someinternalhost_IP = 10.132.0.3

testapp_IP = 104.199.69.52
testapp_port = 9292

Task No: 4

gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup_script.sh

gcloud compute firewall-rules create "default-puma-server" --allow tcp:9292 --source-ranges="0.0.0.0/0" --description="TCP traffic to 9292" --target-tags="puma-server"

Task No: 5
Both tasks are complete, generic and star/advanced (with *) : the full immutable infrastructure image of VM was created. The puma is started as a service in systemd, after Network-online-target. It is enabled via systemctl command and starts automatically when VM is restarted.

the gcloud command was saved in create-redditvm.sh to launch istance from our image.
