#
# P10
# SkillFactory .
#

* create 3 VMs (vm1 & vm2 - Ubuntu 20.04, vm3 - Centos 8)
* install ansible on vm1, create a user for it   
* make a playbook that will authorize this user from vm1 at vm2 & vm3
* make inventory such a way that vm2 & vm3 should be in app group, vm1 in database and web groups
* make a playbook that will:
  -- install docker on an app group
  -- install postgresql-server on a database group, db version and data dirs - variables
* test the playbooks
 