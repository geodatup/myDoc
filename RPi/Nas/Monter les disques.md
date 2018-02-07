sudo fdisk -l
sudo fdisk /dev/sdd
- effacer les partitions (d) autant de fois que nécessaire
- créer une table de partition GPT (g)
- créer une partition (n)
- sauvegarder les modifications

- lancer 
sudo partprobe /dev/sdc
sudo partprobe /dev/sdd

monter les disques

créer un dossier dans media
sudo mkdir /media/flotsam


trouble shooting

sudo mount  /dev/sdd1 /media/flotsam
mount: wrong fs type, bad option, bad superblock on /dev/sdd1,
       missing codepage or helper program, or other error

       In some cases useful info is found in syslog - try
       dmesg | tail or so.

pi@raspberrypi:~ $ dmesg | tail
[683034.218160] EXT4-fs error (device sda1): ext4_read_inode_bitmap:184: comm gunicorn: worke: Cannot read inode bitmap - block_group = 10330, inode_bitmap = 338493441
[683034.237681] EXT4-fs error (device sda1): ext4_read_inode_bitmap:184: comm gunicorn: worke: Cannot read inode bitmap - block_group = 10331, inode_bitmap = 338526209
[685050.348423] F2FS-fs (sdd1): Magic Mismatch, valid(0xf2f52010) - read(0x0)
[685050.348445] F2FS-fs (sdd1): Can't find valid F2FS filesystem in 1th superblock
[685050.348795] F2FS-fs (sdd1): Magic Mismatch, valid(0xf2f52010) - read(0x0)
[685050.348807] F2FS-fs (sdd1): Can't find valid F2FS filesystem in 2th superblock
[685050.348822] F2FS-fs (sdd1): Magic Mismatch, valid(0xf2f52010) - read(0x0)
[685050.348831] F2FS-fs (sdd1): Can't find valid F2FS filesystem in 1th superblock
[685050.348840] F2FS-fs (sdd1): Magic Mismatch, valid(0xf2f52010) - read(0x0)
[685050.348849] F2FS-fs (sdd1): Can't find valid F2FS filesystem in 2th superblock


formater le disque avec mkfs

sudo mkfs -t ext4 -L flotsam /dev/sdd1
sudo mkfs -t ext4 -L jetsam /dev/sdc1



# 