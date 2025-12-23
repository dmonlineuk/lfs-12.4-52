# LFS 12.4-52 (17th December 2025)

Link: https://www.linuxfromscratch.org/lfs/view/development/index.html

## Starting Point

A machine with a single drive attached. Ubuntu live CD booted and installer canceled.

In a terminal:
```bash
# We need git to pull this repo, and optionally gdown for my sources repo in Google Drive (public link provided)
# We may also want SSH for remote access to our VM
sudo apt install git gdown openssh-server

sudo mkdir -v /lfs-project/
sudo chmod 0777 /lfs-project/
cd /lfs-project/

# Scripts fro github. This includes scripts to download source, from er... source :-)
git clone https://github.com/dmonlineuk/lfs-12.4-52.git

# If the source links are broken or timing out, here's a copy of the sources to untar as you see fit:
gdown https://drive.google.com/uc?id=1Qt6RYvtybG2zpCb1sQFMVAvAluECKyZs
tar xf lfs-12.4-52-sources.tar

# If recovering from backup, here's a copy of the backup to pull down:
gdown https://drive.google.com/uc?id=1qzWZcwg_W_uBFsDdoVCNYYU0qQP7GSfe
tar xf 

# For SSH to work, password needs to be set for the ubuntu user
passwd
```

## Structure

We start in the local copy of this github repo:
`cd \lfs-project\lfs-12.4-52\`

```text
02
  02-02.sh:
    Check the host for all pre-requisites. Install missing ones
  02-02-fix.sh:
    Installs the missing pckages. Rerun '02-02.sh' to verify
  02-04.sh:
    Create partitions
  02-05.sh:
    Make filesystems and swap
  02-06.sh:
    Setting the root user, umask and LFS variable
  02-07.sh:
    Mount partitions and swap
03
  03-01-prep.sh:
    Create sources folder
  03-01-fetch-src.sh:
    Download source files. Alternatively, copy from '/lfs-project/lfs-12.4-52/'
  03-01-verify-src.sh:
    Check the md5sums for the source files
  03-01-fetch-patch.sh:
    Download patches. Alternatively, copy from '/lfs-project/lfs-12.4-52/'
  03-01-verify-patch.sh:
    Check the md5sums for the patch files
  03-01-post.sh
    Set the owner for the source files
  md5sums.txt
  md5sums-patch.txt
  wget-list.txt
  wget-list-patch.txt
    Text files used by the scripts above
  run-me-last.sh
    This should be run to make this repo available inside the chroot later
04
  04-02.sh:
    Set up required folder structure
  04-03.sh:
    Create an 'lfs' user
  04-04.sh:
    Set up the 'lfs' environment profile etc
05
  05-02.sh:
    Build binutils - Pass 1
  05-03.sh:
    Build gcc - Pass 1
  05-04.sh:
    Build linux API headers
  05-05.sh:
    Build glibc
  05-05-verify.sh:
    Verify the glibc build
  05-06.sh:
    Build Libstdc++ from gcc
06
  06-02.sh:
    Build m4
  06-03.sh:
    Build ncurses
  06-04.sh:
    Build bash
  06-05.sh:
    Build coreutils
  06-06.sh:
    Build diffutils
  06-07.sh:
    Build file
  06-08.sh:
    Build findutils
  06-09.sh:
    Build gawk
  06-10.sh:
    Build grep
  06-11.sh:
    Build gzip
  06-12.sh:
    Build make
  06-13.sh:
    Build patch
  06-14.sh:
    Build sed
  06-15.sh:
    Build tar
  06-16.sh:
    Build xz
  06-17.sh:
    Build binutils - Pass 2
  06-18.sh:
    Build gcc - Pass 2
07
  07-01.sh:
    Logs in as root
  07-02.sh:
    Claim ownership so file ownership isn't orphaned
  07-03.sh:
    Prep virtual kernel fs
  07-04.sh:
    Enter chroot
  07-05.sh:
    Create folders (Linux FHS)
  07-06.sh:
    More essential files and symlinks
  07-07.sh:
    Build gettext
  07-08.sh:
    Build bison
  07-09.sh:
    Build perl
  07-10.sh:
    Build python
  07-11.sh:
    Build texinfo
  07-12.sh:
    Build util-linux
  07-13-01.sh:
    Cleanup system
  07-13-02-exit.sh:
    Leave chroot, but ONLY if we need to backup/restore
  07-13-02-backup.sh:
    Backup the environment
  07-13-02-restore.sh:
08
