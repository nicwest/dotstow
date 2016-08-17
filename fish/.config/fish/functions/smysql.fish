function smysql
	mysql --ssl-ca=/home/nic/.cert/inter_cert --ssl-cert=/home/nic/.cert/cert --ssl-key=/home/nic/.cert/key $argv
end
