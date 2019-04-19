groupadd oinstall;
groupadd dba;
groupadd oper;
groupadd asmadmin;
groupadd asmdba;
groupadd asmoper;
useradd -g oinstall -G dba,asmdba,oper -d /home/oracle -m -r oracle;
echo oracle | passwd --stdin oracle;
useradd -g oinstall -G dba,asmadmin,asmdba,asmoper -d /home/grid grid;
echo grid | passwd --stdin grid;
mkdir -p /u01/app/11.2.0/grid;
mkdir -p /u01/app/grid;
mkdir -p /u01/app/oracle/product/11.2.0/db_1;
mkdir -p /u02/arch;
mkdir -p /u02/dumpdp;
mkdir -p /u01/app/oracle;
mkdir -p /u03;
mkdir -p /u03/software;
mkdir -p /u01/app/oraInventory;
chown -R grid:oinstall /home/grid;
chown -R oracle:oinstall /home/oracle;
chown -R grid:oinstall /u01;
chown -R grid:oinstall /u01/app/11.2.0/grid;
chown -R grid:oinstall /u01/app/grid;
chown -R oracle:oinstall /u01/app/oracle;
chown -R oracle:oinstall /u02;
chown -R oracle:oinstall /u03;
chown -R grid:oinstall /u01/app/oraInventory;
chown -R oracle:oinstall /u01/app/oracle/product/11.2.0/db_1;
chmod -R 775 /u01;
chmod -R 775 /u02;
chmod -R 775 /u03;
chmod -R 775 /home/oracle;
chmod -R 775 /home/grid;
chmod -R 775 /u01/app/11.2.0/grid;
chmod -R 775 /u01/app/grid;
chmod -R 775 /u01/app/oraInventory;
chmod -R 775 /u01/app/oracle/product/11.2.0/db_1;
cat <<EOF > /home/oracle/.bash_profile
# .bash_profile
 
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
 
# User specific environment and startup programs
 
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:.
export NLS_LANG=American_america.ZHS16GBK
export PATH=\$PATH:\$ORACLE_HOME/bin:.
export ORACLE_SID=asp1
EOF
cat <<EOF > /home/grid/.bash_profile
# .bash_profile
 
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
 
# User specific environment and startup programs
 
export ORACLE_BASE=/u01/app/grid
export ORACLE_HOME=/u01/app/11.2.0/grid
export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:.
export NLS_LANG=American_america.ZHS16GBK
export PATH=\$PATH:\$ORACLE_HOME/bin:.
export ORACLE_SID=asp1
EOF
cat <<EOF >>/etc/sysctl.conf
fs.aio-max-nr = 1048576
fs.file-max = 6815744
kernel.shmall = 2097152
kernel.shmmax = 4294967295
kernel.shmmni = 4096
kernel.sem = 250 32000 100 128
net.ipv4.ip_local_port_range = 9000 65500
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048586
EOF
cat <<EOF >>/etc/security/limits.conf
#for oracle
oracle              soft    nproc   2047
oracle              hard    nproc   16384
oracle              soft    nofile  1024
oracle              hard    nofile  65536
oracle              soft    stack   10240
 
#for grid
grid              soft    nproc   2047
grid              hard    nproc   16384
grid              soft    nofile  1024
grid              hard    nofile  65536
grid              soft    stack   10240
EOF
sysctl -p;
