#!/system/bin/sh

dev_life=`getprop "persist.sys.oplus.nandswap.devlife"`
condition=`getprop "persist.sys.oplus.nandswap.condition"`

total=`df |grep -E " /data$" |awk '{print $2}'`
avail=`df |grep -E " /data$" |awk '{print $4}'`
threshold=total

#64G > 4.5+1G, 128G > 7+1G
if [ $total -gt 73400320 ]; then
	threshold=8388608
#elif [ $total -gt 36700160 ]; then
#	threshold=5767168
fi

if [ "$dev_life" == "false" ]; then
	echo 1 > /proc/nandswap/dev_life
else
	if [ -f "/proc/nandswap/fn_enable" ]; then
		if [ $avail -gt $threshold ]; then
			if [ "$condition" == "true" ]; then
				fn_enable=`getprop "persist.sys.oplus.nandswap"`
			fi
			echo 0 > /proc/nandswap/dev_life
		fi
	fi
fi

if [ "$fn_enable" == "true" ]; then
	if [ ! -f "/data/nandswap/swapfile" ]; then
		dd if=/dev/zero of=/data/nandswap/swapfile bs=1M count=1024
	fi

	if [ -f "/data/nandswap/swapfile" ]; then
		chmod 600 /data/nandswap/swapfile
		mkswap /data/nandswap/swapfile
		# 2020 is just a magic number, must be consistent with the definition SWAP_NANDSWAP_PRIO in include/linux/swap.h
		swapon -d /data/nandswap/swapfile -p 2020
		echo 1 > /proc/nandswap/fn_enable
	fi
else
	echo 0 > /proc/nandswap/fn_enable
	if [ -f "/data/nandswap/swapfile" ]; then
		rm -rf /data/nandswap/swapfile
	fi
fi
