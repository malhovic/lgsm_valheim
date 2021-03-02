# lgsm_valheim
# This is a Valheim Game Server managed with Linux Game Server Manager

# When you first build the container, you will need to connect as the default user (linuxgsm).
# Run the command: vhserver start
# It will state the SteamCMD dependency is missing, this is normal. It will ask for the password to install the final dependency, the default password is "linuxgsm".
# The server will auto install and start itself.

# in the /home/linuxgsm/lgsm/config-lgsm/vhserver folder there are .cfg files, modify the vhserver.cfg file as it is the "last load" and holds the highest priority.
# Change things like: 
# servername="YourServerName"
# serverpassword="YourServerPassword"
# world="your world file name without extension"

# The /home/linuxgsm/.config/unity......... folder structure takes you to where the server world is stored, if you have an existing one replace the one here and make sure you add the world parameter to your vhserver.cfg file

# This container instance relies on three volumes, one for your world files, one for backups, one for the configs. They will autocreate in docker if you don't manually specify them. The server directories are:
# Backup: /home/linuxgsm/lgsm/backup
# Config: /home/linuxgsm/lgsm/config-lgsm/vhserver
# World: /home/linuxgsm/.config/unity3d/IronGate/Valheim
