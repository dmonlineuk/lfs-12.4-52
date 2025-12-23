# Recovery

This repo is built onthe assumption that we are building from a host system running the live cd for Ubuntu 25.10 - as such, any time we reboot, we need to get back to where we left off. This requires setting up the ssh ability, the lfs user, any mounts and temporary virtual setups etc.

We start with chapter 03, since it's probably worth starting from scratch if you're recovering from a place anywhere up to and including chapter 02

# Chapter 03

1. Follow the README.md preliniaries to get git, gdown, and ssh running
2. Run 02-02-fix.sh and 02-02.sh to verify
3. Be root and run 02-06.sh
    - check $LFS and umask!!!
4. Run 02-07.sh to mount all partitions and swap
5. If you need to refresh anything from /lfs/project to /mnt/lfs/lfs-project, you should do so here
6. Continue with getting sources from where you left off

# Chapter 04

1. Steps 1-5 above
2. Scripts 04-03.sh and 04-04.sh are required to recreate lfs user, group and environment

# Chapter 05

1. Step 1 above
2. Run 04-03.sh and 04-04.sh to recreate lfs user and environment
3. Continue building from where you left off

# Chapter 06

1. Steps 1 & 2 above
2. Continue building from where you left off

# Chapter 07

1. Step 1 above
2. Be root and run 07-01.sh
    - check $LFS and umask!!!
3. Run 07-03.sh to ensure the virtual kernel file system is in place
4. Run 07-04.sh to enter 'chroot'
5. Continue with your build

# Chapter 08
