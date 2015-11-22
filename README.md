# webhook

A simple webhook binary to be installed as a service on linux (init & systemd)

On the repository there is a compiled binary for `linux-amd64` of the project [webhook](http://github.com/adnanh/webhook). Please check it's documentation for further details on how to specify the commands.

##What is included

 1. `webhook`: compiled binary for `linux-amd64`.
 2. `hooks.json`: webhook command specification.
 3. `init_install.sh`: script that installs the webhook as a service on **init** system.
 4. `systemd_install.sh`: script that installs the webhook as a service on **systemd**.

##How to use it

    git clone https://github.com/dvddarias/webhook.git
    cd webhook
    ./init_install.sh
    sudo service webhook status

##Uninstall

    ./init_install.sh -u

**Note:** use `init_install.sh` or `systemd_install.sh` according to your init system.
