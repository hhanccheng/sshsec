# sshsec
# This script use to change the default ssh port, and disable password login
# Vps version: debian 10
# Before run this script:
    # Set the key to log in SSH
    # In localhost generate key pairs
    '''
    ssh-keygen -t rsa
    '''
    # transferring the key to the server
    '''
    ssh-copy-id user@serverip 
    '''
# Make sure the server already can login by key
-------------------------------------------------
# What will script do:
    Change ssh default port
    # Edit /etc/ssh/sshd_config
    # Change the port to any number between 5001-65535.
    # !!! when first time change it, recommond leave port 22 open, for to prevent some errors making the server unreachable.
    '''
    #Port 22
    Port 8888
    #AddressFamily any
    #ListenAddress 0.0.0.0
    #ListenAddress ::
    '''
    # Configure sshd to enable key login, and disable password login, remember set the keys before do this
    '''
    # To disable tunneled clear text passwords, change to no here!
    PasswordAuthentication no
    #PermitEmptyPasswords no
    '''

