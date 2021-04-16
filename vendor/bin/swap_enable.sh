#!/vendor/bin/sh
#
#ifdef OPLUS_FEATURE_ZRAM_OPT
    MemTotalStr=`cat /proc/meminfo | grep MemTotal`
    MemTotal=${MemTotalStr:16:8}

    echo lz4 > /sys/block/zram0/comp_algorithm
    echo 160 > /proc/sys/vm/swappiness
    echo 60 > /proc/sys/vm/direct_swappiness
    echo 0 > /proc/sys/vm/page-cluster
    if [ -f /sys/block/zram0/disksize ]; then
        if [ -f /sys/block/zram0/use_dedup ]; then
            echo 1 > /sys/block/zram0/use_dedup
        fi

        if [ $MemTotal -le 524288 ]; then
            #config 384MB zramsize with ramsize 512MB
            echo 402653184 > /sys/block/zram0/disksize
        elif [ $MemTotal -le 1048576 ]; then
            #config 768MB zramsize with ramsize 1GB
            echo 805306368 > /sys/block/zram0/disksize
        elif [ $MemTotal -le 2097152 ]; then
            #config 1.25GB zram size with memory less than 2 GB
            echo zstd > /sys/block/zram0/comp_algorithm
            echo 1342177280 > /sys/block/zram0/disksize
            echo 180 > /proc/sys/vm/swappiness
            echo 0 > /proc/sys/vm/direct_swappiness
            echo 15 > /proc/sys/vm/watermark_scale_factor
            # set min_free_kbytes = 10MB
            echo 10240 > /proc/sys/vm/min_free_kbytes
            #endif
        elif [ $MemTotal -le 3145728 ]; then
            #config 1.6GB zram size with memory less than 3 GB
            echo zstd > /sys/block/zram0/comp_algorithm
            echo 1717986918 > /sys/block/zram0/disksize
            echo 180 > /proc/sys/vm/swappiness
            echo 0 > /proc/sys/vm/direct_swappiness
        elif [ $MemTotal -le 4194304 ]; then
            #config 2GB+512MB zramsize with ramsize 4GB
            echo 2147483648 > /sys/block/zram0/disksize
        elif [ $MemTotal -le 6291456 ]; then
            #config 3GB zramsize with ramsize 6GB
            echo 2415919104 > /sys/block/zram0/disksize
        else
            #config 4GB zramsize with ramsize >=8GB
            echo 4294967296 > /sys/block/zram0/disksize
        fi
        /vendor/bin/mkswap /dev/block/zram0
        /vendor/bin/swapon /dev/block/zram0
    fi

#endif /* OPLUS_FEATURE_ZRAM_OPT */
