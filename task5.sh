chmod a+w /var/logs/archive
cd /var/logs/archive
tar xvzf backup.tar.gz
rm *.tmp
grep -l 'user deleted' .
