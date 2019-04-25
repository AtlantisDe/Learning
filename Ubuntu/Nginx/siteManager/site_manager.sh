#!/bin/bash

######made by sersoong##########
######sersoong@gmail.com########

function ask()
{
	echo 'What do you want?(type "?|h|help" for help)'
	read action
	case $action in 
		init|i) init
			ask
		;;
		addsite|a) read -p "Enter a site config name:"
			config_name=$REPLY
			site="/etc/nginx/sites-available/"${config_name}
			port=$(get_port)
			is_ssl=$(is_usessl)
			directory=$(get_directory ${config_name})
			echo $directory
			read -p "Enter a server name:"
			server_name=$REPLY
			set_site ${site} ${port} ${is_ssl} "nondefault" $directory "${server_name}"
			ask
		;;
		link)list
			read -p "Enter a site config name:"
			config_name=$REPLY
			site="/etc/nginx/sites-available/"${config_name}
			link_enabled ${site} ${config_name}
			list
			ask
		;;
		remove)
			list
			read -p "Enter a site config name:"
			config_name=$REPLY
			remove_available ${config_name}
			list
			ask
		;;
		removelink)
			list
			read -p "Enter a site config name:"
			config_name=$REPLY
			removelink_enabled ${config_name}
			list
			ask
		;;
		list|l)list
			ask
		;;
		tips)tips
			ask
		;;
		
		setdomain|s)echo 'setdomain|s'
			ask
		;;
		t) test_t
			ask
		;;
		restart|r)restart
			ask
		;;
		show)list
			read -p "Enter a site name to show:"
			show $REPLY
			ask
		;;
		clean|c)clean
			ask
		;;
		quit|q|exit) echo 'quit'
		;;
		?|h|help) echo -e "\033[32m ##(list|l) for list site-configs"
			echo " ##(init|i) for init default site"
			echo " ##(addsite|a) for add a new site config"
			echo  " ##(link) for link a site to sites-enabled"
			echo  " ##(remove) for remove a site from sites-available"
			echo  " ##(removelink) for remove link from sites-enabled"
			echo  " ##(restart|r) for restart nginx"
			echo  " ##(show) for showing site config"
			echo  " ##(tips) for protect directory tips"
			echo  " ##(clean|c) for clean bak directory"
			echo -e " ##(quit|q) for quit script\033[0m"
			ask
		;;
		*)  ask
	esac
	
}
function tips()
{
	echo '
	add this:
	location ^~ /directoryname {
		deny all;
		}
		'
}
function list()
{
	echo -e "\033[33m list..sites-available..configs: \033[0m"
	list=$(ls "/etc/nginx/sites-available/")
	echo -e "\033[33m ${list} \033[0m"
	echo -e "\033[32m list..sites-enabled..configs: \033[0m"
	list=$(ls "/etc/nginx/sites-enabled/")
	echo -e "\033[32m ${list} \033[0m"
}
function link_enabled()
{
	ln -s $1 /etc/nginx/sites-enabled/$2	
}
function remove_available()
{
	
	rm -f /etc/nginx/sites-available/$1
}
function removelink_enabled()
{
	rm -f /etc/nginx/sites-enabled/$1
}
function delete_enabled()
{
	if [ -d "/etc/nginx/sites-enabled" ]; then
			(rm /etc/nginx/sites-enabled/* -f)
		fi
}
function get_port()
{
	read -p "Enter a port for site([80]):"
	local port=$REPLY
	if [ -n "$port" ]; then
		echo ${port}
	else
		echo "80"
	fi
}
function get_directory()
{
	read -p "Enter a site root directory([/var/www/html/${1}]):"
	local directory=$REPLY
	if [ -n "$directory" ]; then
		echo $directory
	else
		echo "/var/www/html/"$1
	fi
}

function is_usessl()
{
	read -p "Enter whether use ssl([yes]/no):"
	is_ssl=$REPLY
	if [ -n "$is_ssl" ]; then
			if [[ "$is_ssl" = "yes" ]]; then
				echo "yes"
			elif [[ "$is_ssl" = "no" ]]; then
				echo "no"
			fi
	else
		echo "yes"
	fi
}
function test_t()
{
	return 0
}
function show()
{
	nano "/etc/nginx/sites-available/"$1
}
function clean()
{
	if [ -d "/etc/nginx/bak" ]; then
			(rm /etc/nginx/bak/* -f)
		fi
}
function init()
{
	default_site="/etc/nginx/sites-available/default"
	echo 'init...default'
	local result=$(check ${default_site})
	if [[ ${result} == 1 ]]; then
		echo 'exist...default site'
		if [ ! -d "/etc/nginx/bak" ]; then
			mkdir /etc/nginx/bak
		fi
		mv ${default_site} "/etc/nginx/bak/d"$(date -d now +%Y%m%d%k%M%S)".bak"
		echo 'delected default site'
		touch ${default_site}
		echo 'touched default site'
		set_site ${default_site} 80 "" "default_server" /var/www/html _
	else
		echo 'not exist...default site'
	fi
}

function set_domain()
{
	local site=$1
	local domain=$2
}


function set_site()
{
	port=$2
	is_ssl=$3
	
	if [[ $is_ssl = "yes" ]];then
		is_ssl="ssl"
	else
		is_ssl=""
	fi
	
	is_default=$4
	if [[ $is_default = "default_server" ]];then
		is_default="default_server"
	else
		is_default=""
	fi
	directory=$5
	if [ -n "$6" ];then
		server_name1="server_name "$6";"
	else
		server_name1=""
	fi
	if [ -n "$7" ];then
		server_name2="server_name "$7";"
	else
		server_name2=""
	fi
	if [ -n "$8" ];then
		server_name3="server_name "$8";"
	else
		server_name3=""
	fi
	if [ -n "$9" ];then
		server_name4="server_name "$9";"
	else
		server_name4=""
	fi
	if [[ "$is_ssl" = "ssl" ]]; then
		ssl='
	ssl_certificate /etc/nginx/cert/server.crt;
	ssl_certificate_key /etc/nginx/cert/server.key;
	ssl_session_timeout 5m;
	ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
	ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
	ssl_prefer_server_ciphers on;'
	else
		ssl=''
	fi
(cat <<EOF
server {
	listen ${port} ${is_ssl} ${is_default};
	# listen 443 ssl default_server;
	# listen [::]:443 ssl default_server;
	root ${directory};
	index index.html index.htm index.php;
	${server_name1}
	${server_name2}
	${server_name3}
	${server_name4}
	
	${ssl}
	location / {
		try_files \$uri \$uri/ /index.php?\$query_string;
	}
	location ~ \.php$ {
	    try_files \$uri /index.php =404;
            fastcgi_split_path_info ^(.+\.php)(.*)$;
            fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
            include fastcgi_params;
	}
	location ~ /\.ht {
		deny all;
	}
	
}
EOF
)>$1
echo 'Finished set site'

}
function restart()
{
	echo 'restart..nginx';
	(systemctl restart nginx)
}
function check()
{
	site=$1
	if [ -f "${site}" ]; then
	echo 1
	else
	echo 0
	fi
}

echo "Welcome to use this shell script."
echo "Now.."
ask
