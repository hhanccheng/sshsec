# !/bin/bash
# This script use to quick setup vps security
# change the default ssh port, and disable password login
# vps version: debian 10

# 1. Set the key to log in SSH
    # in localhost generate key pairs
    '''
    ssh-keygen -t rsa
    '''
    # transferring the key to the server
    '''
    ssh-copy-id user@serverip 
    '''


# make sure the server already can login by key
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# 2. Change ssh default port
    # edit /etc/ssh/sshd_config
    # change the port to any number between 5001-65535.
    # !!! when first time change it, recommond leave port 22 open, for to prevent some errors making the server unreachable.
    '''
    Port 22
    Port 8888
    #AddressFamily any
    #ListenAddress 0.0.0.0
    #ListenAddress ::
    '''
    # configure sshd to enable key login, and disable password login, remember set the keys before do this
    '''
    PubkeyAuthentication yes

    # Expect .ssh/authorized_keys2 to be disregarded by default in future.
    AuthorizedKeysFile      .ssh/authorized_keys .ssh/authorized_keys2
    '''
    '''
    # To disable tunneled clear text passwords, change to no here!
    PasswordAuthentication no
    PermitEmptyPasswords no

    '''
mv sshd_config_edited /etc/ssh/sshd_config
systemctl restart ssh
systemctl restart sshd


