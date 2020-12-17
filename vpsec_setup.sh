# !/bin/bash
# edit the sshd_config
mv sshd_config_edited /etc/ssh/sshd_config
# restart the sshd.service
systemctl restart ssh
systemctl restart sshd


