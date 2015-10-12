#!/bin/bash
#Setup instruction of a debian based OS.
#Based on  https://gist.github.com/marcqualie/4745097

USER="upande"
PASS="upandegani"

# Assert Root User
SCRIPTUSER=`whoami`
if [ "$SCRIPTUSER" != "root" ]
then
    echo "You must be root to run this script. Try sudo?"
    exit 1
fi

#Install RabbitMQx
deb http://www.rabbitmq.com/debian/ testing main
wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc
apt-get update
apt-get install rabbitmq-server -y
rm rabbitmq-signing-key-public.asc
service rabbitmq-server start
apt-get autoremove -y

#Installation should be complete. Now let us configure our setup
echo "Installation complete. Now configuring local copy"

#Configure
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user $USER $PASS
rabbitmqctl set_user_tags $USER administrator
rabbitmqctl set_permissions -p / $USER ".*" ".*" ".*"
rabbitmqctl delete_user guest
service rabbitmq-server restart

# Show settings
echo "Default Login:"
echo "  url: http://localhost:15672/"
echo "  user: $USER"
echo "  pass: $PASS"
