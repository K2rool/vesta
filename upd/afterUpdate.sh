#!/bin/bash

source /etc/profile.d/vesta.sh
source /usr/local/vesta/func/main.sh
source /usr/local/vesta/conf/vesta.conf

if [ "$VERSION" = "0.9.8" ]; then
    #Convert to made I.T.
    bash /usr/local/vesta/upd/add_ipv6.sh
    bash /usr/local/vesta/upd/add_plugin.sh
    VERSION="0.0.1"
    sed -i "s/VERSION=.*/VERSION='0.0.1'/g" /usr/local/vesta/conf/vesta.conf
fi

if [ "$VERSION" = "0.0.1" ]; then
    VERSION="0.0.2"
    sed -i "s/VERSION=.*/VERSION='0.0.2'/g" /usr/local/vesta/conf/vesta.conf
fi

if [ "$VERSION" = "0.0.2" ]; then
    VERSION="0.0.3"
    sed -i "s/VERSION=.*/VERSION='0.0.3'/g" /usr/local/vesta/conf/vesta.conf
fi

if [ "$VERSION" = "0.0.3" ]; then
    bash /usr/local/vesta/upd/add_mail_ssl.sh
    VERSION="0.0.4"
    sed -i "s/VERSION=.*/VERSION='0.0.4'/g" /usr/local/vesta/conf/vesta.conf
    
    
    $BIN/v-update-web-templates
    userlist=$(ls --sort=time $VESTA/data/users/)
    for user in $userlist; do
        $BIN/v-rebuild-user $user
    done
fi

if [ "$VERSION" = "0.0.4" ]; then
    bash /usr/local/vesta/upd/add_mail_ssl.sh
    VERSION="0.0.5"
    sed -i "s/VERSION=.*/VERSION='0.0.5'/g" /usr/local/vesta/conf/vesta.conf
    
    bash /usr/local/vesta/upd/separate_web_conf.sh
fi

if [ "$VERSION" = "0.0.5" ]; then
    VERSION="0.0.6"
    sed -i "s/VERSION=.*/VERSION='0.0.6'/g" /usr/local/vesta/conf/vesta.conf
fi

if [ "$VERSION" = "0.0.6" ]; then
    VERSION="0.0.7"
    sed -i "s/VERSION=.*/VERSION='0.0.7'/g" /usr/local/vesta/conf/vesta.conf
fi

if [ "$VERSION" = "0.0.7" ]; then
    VERSION="0.0.8"
#    sed -i "s/VERSION=.*/VERSION='0.0.8'/g" /usr/local/vesta/conf/vesta.conf

    #Fix not changed templates
    userlist=$(ls --sort=time $VESTA/data/users/)
    for user in $userlist; do
        $BIN/v-rebuild-web-domains $user
    done
fi

bash /usr/local/vesta/upd/add_default_plugins.sh