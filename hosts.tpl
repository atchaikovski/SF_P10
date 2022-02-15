[web]
%{ for index,ip in list_web ~}
vm1 ansible_host=${ip}
%{ endfor ~}

[database]
%{ for index,ip in list_web ~}
vm1 ansible_host=${ip}
%{ endfor ~}

[app]
