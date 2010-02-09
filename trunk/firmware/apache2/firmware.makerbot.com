<VirtualHost *:80>
  DocumentRoot /home/makerb0t/web/firmware.makerbot.com
  ServerName firmware.makerbot.com
  <Directory "/home/makerb0t/web/firmware.makerbot.com">
    allow from all
    Options -Indexes
  </Directory>
</VirtualHost>
