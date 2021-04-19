if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  echo "IPv4 is up"
  apt-get update
  if [ -d "/var/log/sumologic-vmware" ]; then
    echo "Removing old temp repo directory."
    sudo rm -R sumologic-vmware
  fi
  sudo git clone https://github.com/SumoLogic/sumologic-vmware
  if [ -d "/var/log/vmware" ]; then
    echo "Backing up old script installation."
    sudo mv -R /var/log/vmware /var/log/vmware_$(date -d "today" +"%Y%m%d%H%M")
  fi
  sudo mv sumologic-vmware/vsphere /var/log/vmware
  sudo chmod 777 /var/log/vmware
else
  echo "IPv4 is down"
fi
