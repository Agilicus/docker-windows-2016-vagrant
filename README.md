## docker-windows-2016-vagrant

This creates a vagrant image which is running docker on windows 2016
server.

I tested it with
[windows-2016-vagrant](https://github.com/rgl/windows-2016-vagrant),
but it probably works with any Windows Vagrant box.

It installs docker-EE (currently dockermsftprovider:Docker/17.06.2-ee-14#DockerDefault)
from Microsoft.

vagrant ssh -t -c '/vagrant/ps.ps1 example/docker-info.ps1'

## Setup

I tested this with provider=libvirt but it should work with
VirtualBox.

You will need to have these two plugins installed:

```
vagrant plugin install vagrant-windows-update
vagrant plugin install vagrant-reload
```
