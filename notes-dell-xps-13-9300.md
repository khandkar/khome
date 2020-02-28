Killer resources:

    https://support.killernetworking.com/knowledge-base/killer-ax1650-in-debian-ubuntu-16-04/
    https://support.killernetworking.com/knowledge-base/killer-ax1650-in-debian-ubuntu-16-04-without-internet-access/
    https://support.killernetworking.com/wp-content/uploads/Backport_Iwlwifi-Example.txt


Debian bullseye (currently the testing) install says the following firmware is
missing:

    iwlwifi-Qu-b0-hr-b0-39.ucode
    iwlwifi-Qu-b0-hr-b0-40.ucode
    iwlwifi-Qu-b0-hr-b0-41.ucode
    iwlwifi-Qu-b0-hr-b0-42.ucode
    iwlwifi-Qu-b0-hr-b0-43.ucode
    iwlwifi-Qu-b0-hr-b0-44.ucode
    iwlwifi-Qu-b0-hr-b0-45.ucode
    iwlwifi-Qu-b0-hr-b0-46.ucode
    iwlwifi-Qu-b0-hr-b0-47.ucode
    iwlwifi-Qu-b0-hr-b0-48.ucode
    iwlwifi-Qu-b0-hr-b0-49.ucode
    iwlwifi-Qu-b0-hr-b0-50.ucode

On Ubuntu we get this:

    $ cat /etc/lsb-release
    DISTRIB_ID=Ubuntu
    DISTRIB_RELEASE=18.04
    DISTRIB_CODENAME=bionic
    DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS (beaver- X00)"

    $ ls -l /lib/firmware | grep -i iwlwifi
    -rw-r--r--  1 root root  337520 Mar 29  2017 iwlwifi-1000-5.ucode
    -rw-r--r--  1 root root  337572 Mar 29  2017 iwlwifi-100-5.ucode
    -rw-r--r--  1 root root  689680 Mar 29  2017 iwlwifi-105-6.ucode
    -rw-r--r--  1 root root  701228 Mar 29  2017 iwlwifi-135-6.ucode
    -rw-r--r--  1 root root  695876 Mar 29  2017 iwlwifi-2000-6.ucode
    -rw-r--r--  1 root root  707392 Mar 29  2017 iwlwifi-2030-6.ucode
    -rw-r--r--  1 root root  609892 Mar 29  2017 iwlwifi-3160-10.ucode
    -rw-r--r--  1 root root  683996 Mar 29  2017 iwlwifi-3160-12.ucode
    -rw-r--r--  1 root root  688616 Mar 29  2017 iwlwifi-3160-13.ucode
    -rw-r--r--  1 root root  918212 Mar 29  2017 iwlwifi-3160-16.ucode
    -rw-r--r--  1 root root  918268 Jan 29 14:38 iwlwifi-3160-17.ucode
    -rw-r--r--  1 root root  670484 Mar 29  2017 iwlwifi-3160-7.ucode
    -rw-r--r--  1 root root  667284 Mar 29  2017 iwlwifi-3160-8.ucode
    -rw-r--r--  1 root root  669872 Mar 29  2017 iwlwifi-3160-9.ucode
    -rw-r--r--  1 root root 1384856 Nov 17  2017 iwlwifi-3168-21.ucode
    -rw-r--r--  1 root root 1028092 Apr 24  2018 iwlwifi-3168-22.ucode
    -rw-r--r--  1 root root 1032436 Dec  5  2017 iwlwifi-3168-27.ucode
    -rw-r--r--  1 root root 1036276 Jan 29 14:38 iwlwifi-3168-29.ucode
    -rw-r--r--  1 root root  150100 Mar 29  2017 iwlwifi-3945-2.ucode
    -rw-r--r--  1 root root  187972 Mar 29  2017 iwlwifi-4965-2.ucode
    -rw-r--r--  1 root root  340696 Jan 28 15:52 iwlwifi-5000-5.ucode
    -rw-r--r--  1 root root  337400 Mar 29  2017 iwlwifi-5150-2.ucode
    -rw-r--r--  1 root root  454608 Mar 29  2017 iwlwifi-6000-4.ucode
    -rw-r--r--  1 root root  444128 Mar 29  2017 iwlwifi-6000g2a-5.ucode
    -rw-r--r--  1 root root  677296 Mar 29  2017 iwlwifi-6000g2a-6.ucode
    -rw-r--r--  1 root root  679436 Mar 29  2017 iwlwifi-6000g2b-6.ucode
    -rw-r--r--  1 root root  469780 Mar 29  2017 iwlwifi-6050-5.ucode
    -rw-r--r--  1 root root  672352 Mar 29  2017 iwlwifi-7260-10.ucode
    -rw-r--r--  1 root root  782300 Mar 29  2017 iwlwifi-7260-12.ucode
    -rw-r--r--  1 root root  786920 Mar 29  2017 iwlwifi-7260-13.ucode
    -rw-r--r--  1 root root 1049284 Mar 29  2017 iwlwifi-7260-16.ucode
    -rw-r--r--  1 root root 1049340 Jan 29 14:38 iwlwifi-7260-17.ucode
    -rw-r--r--  1 root root  683236 Mar 29  2017 iwlwifi-7260-7.ucode
    -rw-r--r--  1 root root  679780 Mar 29  2017 iwlwifi-7260-8.ucode
    -rw-r--r--  1 root root  680508 Mar 29  2017 iwlwifi-7260-9.ucode
    -rw-r--r--  1 root root  736844 Mar 29  2017 iwlwifi-7265-10.ucode
    -rw-r--r--  1 root root  880604 Mar 29  2017 iwlwifi-7265-12.ucode
    -rw-r--r--  1 root root  885224 Mar 29  2017 iwlwifi-7265-13.ucode
    -rw-r--r--  1 root root 1180356 Mar 29  2017 iwlwifi-7265-16.ucode
    -rw-r--r--  1 root root 1180412 Jan 29 14:38 iwlwifi-7265-17.ucode
    -rw-r--r--  1 root root  690452 Mar 29  2017 iwlwifi-7265-8.ucode
    -rw-r--r--  1 root root  697828 Mar 29  2017 iwlwifi-7265-9.ucode
    lrwxrwxrwx  1 root root      21 Nov 17  2017 iwlwifi-7265D-10.ucode -> iwlwifi-7265-10.ucode
    -rw-r--r--  1 root root 1002800 Mar 29  2017 iwlwifi-7265D-12.ucode
    -rw-r--r--  1 root root 1008692 Mar 29  2017 iwlwifi-7265D-13.ucode
    -rw-r--r--  1 root root 1384500 Mar 29  2017 iwlwifi-7265D-16.ucode
    -rw-r--r--  1 root root 1383604 Nov 17  2017 iwlwifi-7265D-17.ucode
    -rw-r--r--  1 root root 1385368 Nov 17  2017 iwlwifi-7265D-21.ucode
    -rw-r--r--  1 root root 1028376 Apr 24  2018 iwlwifi-7265D-22.ucode
    -rw-r--r--  1 root root 1032740 Dec  5  2017 iwlwifi-7265D-27.ucode
    -rw-r--r--  1 root root 1036432 Jan 29 14:38 iwlwifi-7265D-29.ucode
    -rw-r--r--  1 root root 1745176 Mar 29  2017 iwlwifi-8000C-13.ucode
    -rw-r--r--  1 root root 2351636 Mar 29  2017 iwlwifi-8000C-16.ucode
    -rw-r--r--  1 root root 2394060 Nov 17  2017 iwlwifi-8000C-21.ucode
    -rw-r--r--  1 root root 2120860 Jan 29 14:38 iwlwifi-8000C-22.ucode
    -rw-r--r--  1 root root 2227284 Dec  5  2017 iwlwifi-8000C-27.ucode
    -rw-r--r--  1 root root 2310116 Dec  6  2017 iwlwifi-8000C-31.ucode
    -rw-r--r--  1 root root 2448976 Apr 25  2018 iwlwifi-8000C-34.ucode
    -rw-r--r--  1 root root 2486572 Jan 29 14:38 iwlwifi-8000C-36.ucode
    -rw-r--r--  1 root root 2389968 Nov 17  2017 iwlwifi-8265-21.ucode
    -rw-r--r--  1 root root 1811984 Apr 24  2018 iwlwifi-8265-22.ucode
    -rw-r--r--  1 root root 2234528 Dec  5  2017 iwlwifi-8265-27.ucode
    -rw-r--r--  1 root root 2307104 Dec  6  2017 iwlwifi-8265-31.ucode
    -rw-r--r--  1 root root 2440780 Apr 25  2018 iwlwifi-8265-34.ucode
    -rw-r--r--  1 root root 2498044 Jan 29 14:38 iwlwifi-8265-36.ucode
    -rw-r--r--  1 root root 2632620 Apr 24  2018 iwlwifi-9000-pu-b0-jf-b0-33.ucode
    -rw-r--r--  1 root root 2678284 Jan 29 14:38 iwlwifi-9000-pu-b0-jf-b0-34.ucode
    -rw-r--r--  1 root root 2520568 Jan 29 14:38 iwlwifi-9000-pu-b0-jf-b0-38.ucode
    -rw-r--r--  1 root root 2620464 Jan 29 14:38 iwlwifi-9000-pu-b0-jf-b0-41.ucode
    -rw-r--r--  1 root root 2543536 Jan 29 14:38 iwlwifi-9000-pu-b0-jf-b0-43.ucode
    -rw-r--r--  1 root root 1462068 Jan 29 14:38 iwlwifi-9000-pu-b0-jf-b0-46.ucode
    -rw-r--r--  1 root root 2637216 Apr 24  2018 iwlwifi-9260-th-b0-jf-b0-33.ucode
    -rw-r--r--  1 root root 2678092 Jan 29 14:38 iwlwifi-9260-th-b0-jf-b0-34.ucode
    -rw-r--r--  1 root root 2521412 Jan 29 14:38 iwlwifi-9260-th-b0-jf-b0-38.ucode
    -rw-r--r--  1 root root 2620656 Jan 29 14:38 iwlwifi-9260-th-b0-jf-b0-41.ucode
    -rw-r--r--  1 root root 2558176 Jan 29 14:38 iwlwifi-9260-th-b0-jf-b0-43.ucode
    -rw-r--r--  1 root root 1463820 Jan 29 14:38 iwlwifi-9260-th-b0-jf-b0-46.ucode
    -rw-r--r--  1 root root 1044072 Jan 29 14:38 iwlwifi-cc-a0-46.ucode
    -rw-r--r--  1 root root 1096704 Jan 29 14:38 iwlwifi-cc-a0-48.ucode
    -rw-r--r--  1 root root 1106208 Jan 29 14:38 iwlwifi-Qu-b0-hr-b0-48.ucode
    -rw-r--r--  1 root root 1053156 Jan 29 14:38 iwlwifi-Qu-b0-jf-b0-48.ucode
    -rw-r--r--  1 root root 1106228 Jan 29 14:38 iwlwifi-Qu-c0-hr-b0-48.ucode
    -rw-r--r--  1 root root 1053176 Jan 29 14:38 iwlwifi-Qu-c0-jf-b0-48.ucode
    -rw-r--r--  1 root root 1105648 Jan 29 14:38 iwlwifi-QuZ-a0-hr-b0-48.ucode
