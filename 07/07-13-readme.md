# Backup and Restore

See: https://www.linuxfromscratch.org/lfs/view/development/chapter07/cleanup.html

## Important footnote:

If you left the chroot environment to create a backup or restart building using a restore, remember to check that the virtual file systems are still mounted (findmnt | grep $LFS should show at least $LFS/dev, $LFS/proc, and $LFS/sys as mounted). If they are not mounted, remount them now as described in Section 7.3, “Preparing Virtual Kernel File Systems” and re-enter the chroot environment (see Section 7.4, “Entering the Chroot Environment”) before continuing. 