# MariaDB Server & Spider Engine Test Environment
### The Experiment Will Create 1 Frontend (Spider) Node & 2 Backend (Storage) Nodes

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
* `ansible-playbook -i hosts spider.yml`

#### MariaDB Node Access

* `vagrant ssh node1` or `vagrant ssh node2` or `vagrant ssh node3`

####  Clean Up

* `vagrant destroy --force`

#### Need Additional Help?

* Documentation: https://mariadb.com/kb/en/library/spider/
* Consulting: https://mariadb.com/services/consulting
* Enterprise Architect: https://mariadb.com/services/enterprise-architect
