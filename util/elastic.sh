TARGET_KEY="#network.host: localhost"
REPLACEMENT_VALUE="network.host: localhost"
CONFIG_FILE=/etc/elasticsearch/elasticsearch.yml

wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
echo 'deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list
sudo apt-get update
sudo apt-get install python-numpy #Requirements fail if I do not do this so..
sudo apt-get -y install elasticsearch=1.4.4
sed -c -i "s/\($TARGET_KEY *= *\).*/\1$REPLACEMENT_VALUE/" $CONFIG_FILE
sudo service elasticsearch restart
sudo update-rc.d elasticsearch defaults 95 10
