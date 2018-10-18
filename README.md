# vg-devops1_infra
vg-devops1 Infra repository
Task No: 3
The modern and secure way of connecting to the remote host behind bastion server is to use ProxyCommand. The working solution that I found for my IP addresses was
ssh -o ProxyCommand='ssh -i ~/.ssh/appuser -W %h:%p appuser@35.210.209.239' appuser@10.132.0.3

To connect via alias like ssh someinternalhost, I modified ~/.ssh/config file like

Host bastion
        HostName 35.210.209.239
        User appuser
        IdentityFile ~/.ssh/appuser
        ProxyCommand none

Host someinernalhost
        HostName 10.132.0.3
        User appuser
        IdentityFile ~/.ssh/appuser
        ProxyCommand ssh bastion -W %h:%p appuser@35.210.209.239

The Pritunl server was successfully installed. I've also installed open source Printunl OpenVPN client via https://client.pritunl.com/

While connecting to VPN, an additional tun/virtual interface was created in the server machine. The IP address of this interface is 192.168.237.1. The client also creates on my machine a similar interface with IP address 192.168.237.1 (temporary)

bastion_IP = 35.210.209.239
someinternalhost_IP = 10.132.0.3
