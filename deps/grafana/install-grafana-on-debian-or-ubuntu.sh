#! /bin/sh

# === Package details ===
# Installs binary to
#   /usr/sbin/grafana-server
# Installs Init.d script to
#   /etc/init.d/grafana-server
# Creates default file (environment vars) to
#   /etc/default/grafana-server
# Installs configuration file to
#   /etc/grafana/grafana.ini
# Installs systemd service (if systemd is available) name
#   grafana-server.service
# The default configuration sets the log file at
#   /var/log/grafana/grafana.log
# The default configuration specifies a SQLite3 db at
#   /var/lib/grafana/grafana.db
# Installs HTML/JS/CSS and other Grafana files at
#   /usr/share/grafana


apt_source_file='/etc/apt/sources.list.d/grafana.list'

sudo apt install -y apt-transport-https
sudo apt install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo 'deb https://packages.grafana.com/oss/deb stable main' | sudo tee -a "$apt_source_file"
sudo chmod a+r "$apt_source_file"
sudo apt update
sudo apt install grafana

# Adding system user `grafana' (UID 130) ...
# Adding new user `grafana' (UID 130) with group `grafana' ...
# Not creating home directory `/usr/share/grafana'.
# ### NOT starting on installation, please execute the following statements to configure grafana to start automatically using systemd
#  sudo /bin/systemctl daemon-reload
#  sudo /bin/systemctl enable grafana-server
# ### You can start grafana-server by executing
#  sudo /bin/systemctl start grafana-server

sudo systemctl daemon-reload
#sudo systemctl start grafana-server
#sudo systemctl status grafana-server
#sudo systemctl enable grafana-server.service
