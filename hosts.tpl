[web]
%{ for index,ip in list_ubuntu ~}
vm1 ansible_host=${ip}
%{ endfor ~}

[database]
%{ for index,ip in list_ubuntu ~}
vm1 ansible_host=${ip}
%{ endfor ~}

[app]
%{ for index,ip in list_ubuntu ~}
vm2 ansible_host=${ip}
%{ endfor ~}
%{ for index,ip in list_centos ~}
vm3 ansible_host=${ip}
%{ endfor ~}

