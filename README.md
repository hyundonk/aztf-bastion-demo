# Azure Bastion Demo

## Currently in preparation... Test environment not yet configured!


### How to connect using native client


https://docs.microsoft.com/en-us/azure/bastion/connect-native-client-windows#connect-linux

```
# Currently, bastion ssh command is only supported on Winwdows Client. (e.g. Windows version of Azure CLI.) On Linux client, you can use "bastion tunnel" command instead

C:\> az network bastion ssh --name examplebastion --resource-group deleteme-demo4255853811 --target-resource-id /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx/resourceGroups/deleteme-demo4255853811/providers/Microsoft.Compute/virtualMachines/webserver --auth-type "password" --username azureuser
Command group 'network bastion' is in preview and under development. Reference and support levels: https://aka.ms/CLI_refstatus
azureuser@localhost's password:
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-1028-azure x86_64)
```


```
# Tunneling command in an bash session
$ az network bastion tunnel --name examplebastion --resource-group deleteme-demo4255853811 --target-resource-id /subscriptions/xxxxxxx-xxxx-xxxx-xxxxxxxxxx/resourceGroups/deleteme-demo4255853811/providers/Microsoft.Compute/virtualMachines/webserver

# Then in another bash session, run ssh
$ ssh azureuser@127.0.0.1 -p 8022
The authenticity of host '[127.0.0.1]:8022 ([127.0.0.1]:8022)' can't be established.
ECDSA key fingerprint is SHA256:
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[127.0.0.1]:8022' (ECDSA) to the list of known hosts.
azureuser@127.0.0.1's password:
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-1028-azure x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun Feb 20 07:29:08 UTC 2022

  System load:  0.01              Processes:             133
  Usage of /:   7.0% of 28.90GB   Users logged in:       1
  Memory usage: 5%                IPv4 address for eth0: 10.10.0.4
  Swap usage:   0%


41 updates can be applied immediately.
25 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable


Last login: Sun Feb 20 07:18:53 2022 from 10.10.2.4
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

azureuser@webserver:~$


```

```
# Also you can use scp to upload/download files 

$ scp -P 8022 ./extension.log azureuser@127.0.0.1:/h
ome/azureuser/
azureuser@127.0.0.1's password:
extension.log                                           100%  215KB   1.7MB/s   00:00
```




