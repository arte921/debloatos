sh compile.sh

hdparm -W 0 /dev/sdb

dd if=os.bin of=/dev/sdb seek=0

sync
echo 3 > /proc/sys/vm/drop_caches