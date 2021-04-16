#!/system/bin/sh

chown system system /sys/bus/platform/devices/soc/soc\:fpc_interrupt/clk_enable
chown system system /sys/bus/platform/devices/soc/soc\:fpc_interrupt/wakelock_enable
chown system system /sys/bus/platform/devices/soc/soc\:fpc_interrupt/irq
chown system system /sys/bus/platform/devices/soc/soc\:fpc_interrupt/irq_enable
chmod 0200 /sys/bus/platform/devices/soc/soc\:fpc_interrupt/irq_enable
chmod 0200 /sys/bus/platform/devices/soc/soc\:fpc_interrupt/clk_enable
chmod 0200 /sys/bus/platform/devices/soc/soc\:fpc_interrupt/wakelock_enable
chmod 0600 /sys/bus/platform/devices/soc/soc\:fpc_interrupt/irq

chown system system /sys/bus/platform/devices/fpc_fp/clk_enable
chown system system /sys/bus/platform/devices/fpc_fp/wakelock_enable
chown system system /sys/bus/platform/devices/fpc_fp/irq
chown system system /sys/bus/platform/devices/fpc_fp/irq_enable
chown system system /sys/bus/platform/devices/fpc_interrupt/regulator_enable
chown system system /sys/bus/platform/devices/fpc_interrupt/irq_unexpected
chmod 0200 /sys/bus/platform/devices/fpc_fp/irq_enable
chmod 0200 /sys/bus/platform/devices/fpc_fp/clk_enable
chmod 0200 /sys/bus/platform/devices/fpc_fp/wakelock_enable
chmod 0600 /sys/bus/platform/devices/fpc_fp/irq
chmod 0200 /sys/bus/platform/devices/fpc_interrupt/regulator_enable
chmod 0200 /sys/bus/platform/devices/fpc_interrupt/irq_unexpected
#add for silead
chown system:system /dev/silead_fp
chmod 0666 /dev/silead_fp