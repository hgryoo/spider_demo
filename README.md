# MariaDB Server & Spider Engine Test Environment
### This Experiment Will Create 1 Frontend (Spider) Node & 3 Backend (Storage) Nodes

#### Description
After completing the following setup, you may access the spider database via the mysql client on node1 and view the "world" schema.  You may also connect via your favorite GUI by connection to IP: **10.10.10.10** with username: **dba** and password: **demo_password** 

Tables are stored on separate backend servers to demonstrate horizontal sharding.

#### Prerequisites

* [Git](https://git-scm.com/download/)
* [Vagrant 2.0.0+](https://www.vagrantup.com/downloads.html)
* [Virtualbox 5.1+](https://www.virtualbox.org/wiki/Downloads)
* Ansible
  * [Ansible 2.4+ For MacOS/Linux](http://docs.ansible.com/ansible/latest/intro_installation.html)
  * [Ansible 2.4+ For Windows](https://www.jeffgeerling.com/blog/2017/using-ansible-through-windows-10s-subsystem-linux)

#### Setup

* `git clone https://github.com/toddstoffel/spider_demo.git`
* cd to cloned folder
* `vagrant plugin install vagrant-vbguest`
* `vagrant up`
* `ansible-playbook -i inventory provision.yml`

#### MariaDB Spider Node Access

* `vagrant ssh node1`

####  Clean Up

* `vagrant destroy --force`

#### Need Additional Help?

* Documentation: https://mariadb.com/kb/en/library/spider/
* Consulting: https://mariadb.com/services/consulting
