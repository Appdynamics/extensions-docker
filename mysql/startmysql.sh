#!/bin/bash
set -e

DB_NAME=${DB_NAME:-}
DB_USER=${DB_USER:-}
DB_PASS=${DB_PASS:-}

DB_REMOTE_ROOT_NAME=${DB_REMOTE_ROOT_NAME:-}
DB_REMOTE_ROOT_PASS=${DB_REMOTE_ROOT_PASS:-}
DB_REMOTE_ROOT_HOST=${DB_REMOTE_ROOT_HOST:-"192.168.57.1"}

# disable error log
sed 's/^log_error/# log_error/' -i /etc/mysql/my.cnf

# Fixing StartUp Porblems with some DNS Situations and Speeds up the stuff
# http://www.percona.com/blog/2008/05/31/dns-achilles-heel-mysql-installation/
cat > /etc/mysql/conf.d/mysql-skip-name-resolv.cnf <<EOF
[mysqld]
skip_name_resolve
EOF

# fix permissions and ownership of /var/lib/mysql
mkdir -p -m 700 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

# fix permissions and ownership of /run/mysqld
mkdir -p -m 0755 /run/mysqld
chown -R mysql:root /run/mysqld

#
# the default password for the debian-sys-maint user is randomly generated
# during the installation of the mysql-server package.
#
# Due to the nature of docker we blank out the password such that the maintenance
# user can login without a password.
#
sed 's/password = .*/password = /g' -i /etc/mysql/debian.cnf

# initialize MySQL data directory
if [ ! -d /var/lib/mysql/mysql ]; then
  echo "Installing database..."
  mysql_install_db --user=mysql >/dev/null 2>&1

  # start mysql server
  echo "Starting MySQL server..."
  /usr/bin/mysqld_safe >/dev/null 2>&1 &

  # wait for mysql server to start (max 30 seconds)
  timeout=30
  echo -n "Waiting for database server to accept connections"
  while ! /usr/bin/mysqladmin -u root status >/dev/null 2>&1
  do
    timeout=$(($timeout - 1))
    if [ $timeout -eq 0 ]; then
      echo -e "\nCould not connect to database server. Aborting..."
      exit 1
    fi
    echo -n "."
    sleep 1
  done
  echo

  ## create a localhost only, debian-sys-maint user
  ## the debian-sys-maint is used while creating users and database
  ## as well as to shut down or starting up the mysql server via mysqladmin
  echo "Creating debian-sys-maint user..."
  mysql -uroot -e "GRANT ALL PRIVILEGES on *.* TO 'debian-sys-maint'@'localhost' IDENTIFIED BY '' WITH GRANT OPTION;"

  if [ -n "${DB_REMOTE_ROOT_NAME}" -a -n "${DB_REMOTE_ROOT_HOST}" ]; then
    echo "Creating remote user \"${DB_REMOTE_ROOT_NAME}\" with root privileges..."
    mysql -uroot \
    -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_REMOTE_ROOT_NAME}'@'${DB_REMOTE_ROOT_HOST}' IDENTIFIED BY '${DB_REMOTE_ROOT_PASS}' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  fi

  /usr/bin/mysqladmin --defaults-file=/etc/mysql/debian.cnf shutdown
fi

# create new user / database
if [ -n "${DB_USER}" -o -n "${DB_NAME}" ]; then
  /usr/bin/mysqld_safe >/dev/null 2>&1 &

  # wait for mysql server to start (max 30 seconds)
  timeout=30
  while ! /usr/bin/mysqladmin -u root status >/dev/null 2>&1
  do
    timeout=$(($timeout - 1))
    if [ $timeout -eq 0 ]; then
      echo "Could not connect to mysql server. Aborting..."
      exit 1
    fi
    sleep 1
  done

  if [ -n "${DB_NAME}" ]; then
    for db in $(awk -F',' '{for (i = 1 ; i <= NF ; i++) print $i}' <<< "${DB_NAME}"); do
      echo "Creating database \"$db\"..."
      mysql --defaults-file=/etc/mysql/debian.cnf \
        -e "CREATE DATABASE IF NOT EXISTS \`$db\` DEFAULT CHARACTER SET \`utf8\` COLLATE \`utf8_unicode_ci\`;"
        if [ -n "${DB_USER}" ]; then
          echo "Granting access to database \"$db\" for user \"${DB_USER}\"..."
          mysql --defaults-file=/etc/mysql/debian.cnf \
          -e "GRANT ALL PRIVILEGES ON \`$db\`.* TO '${DB_USER}' IDENTIFIED BY '${DB_PASS}';"
        fi
      done
  fi
  /usr/bin/mysqladmin --defaults-file=/etc/mysql/debian.cnf shutdown
fi

# listen on all interfaces
cat > /etc/mysql/conf.d/mysql-listen.cnf <<EOF
[mysqld]
bind = 0.0.0.0
EOF

exec /usr/bin/mysqld_safe
