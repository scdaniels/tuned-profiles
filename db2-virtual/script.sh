#!/bin/bash
# DB2 ktune script
. /usr/lib/tuned/functions
start() {
        CURR_SHMALL=`sysctl -n kernel.shmall`
        CURR_SHMMAX=`sysctl -n kernel.shmmax`
        CURR_SHMMNI=`sysctl -n kernel.shmmni`
        CURR_SEM=`sysctl -n kernel.sem`
        CURR_SWAPPINESS=`sysctl -n vm.swappiness`
        CURR_DIRTY_BCKGRD_RATIO=`sysctl -n vm.dirty_background_ratio`
        CURR_DIRTY_RATIO=`sysctl -n vm.dirty_ratio`
        CURR_DIRTY_EXPIRE_CENTISECS=`sysctl -n vm.dirty_expire_centisecs`
        CURR_FILE_MAX=`sysctl -n fs.file-max`
        CURR_AIO_MAX_NR=`sysctl -n fs.aio-max-nr`
        CURR_LCL_PRT_RNG=`sysctl -n net.ipv4.ip_local_port_range`
        CURR_RMEM=`sysctl -n net.core.rmem_default`
        CURR_RMEM_MAX=`sysctl -n net.core.rmem_max`
        CURR_WMEM=`sysctl -n net.core.wmem_default`
        CURR_WMEM_MAX=`sysctl -n net.core.wmem_max`
        CURR_PANIC_ON_OOPS=`sysctl -n kernel.panic_on_oops`
        save_value kernel.shmall "$CURR_SHMALL"
        save_value kernel.shmmax "$CURR_SHMMAX"
        save_value kernel.shmmni "$CURR_SHMMNI"
        save_value vm.swappiness "$CURR_SWAPPINESS"
        save_value vm.dirty_background_ratio "$CURR_DIRTY_BCKGRD_RATIO"
        save_value vm.dirty_ratio "$CURR_DIRTY_RATIO"
        save_value vm.dirty_expire_centisecs "$CURR_DIRTY_EXPIRE_CENTISECS"
        save_value fs.file-max "$CURR_FILE_MAX"
        save_value fs.aio-max-nr "$CURR_AIO_MAX_NR"
        save_value net.ipv4.ip_local_port_range "$CURR_LCL_PRT_RNG"
        save_value net.core.rmem_default "$CURR_RMEM"
        save_value net.core.rmem_max "$CURR_RMEM_MAX"
        save_value net.core.wmem_default "$CURR_WMEM"
        save_value net.core.wmem_max "$CURR_WMEM_MAX"
        save_value kernel.panic_on_oops "$CURR_PANIC_ON_OOPS"
        return 0
}

stop() {
        SHMALL=`restore_value kernel.shmall`
        SHMMAX=`restore_value kernel.shmmax`
        SHMMNI=`restore_value kernel.shmmni`
        SWAPPINESS=`restore_value vm.swappiness`
        DIRTY_BCKGRD_RATIO=`restore_value vm.dirty_background_ratio`
        DIRTY_EXPIRE_CENTISECS=`restore_value vm.dirty_expire_centisecs`
        FILE_MAX=`restore_value fs.file-max`
        LCL_PRT_RNG=`restore_value net.ipv4.ip_local_port_range`
        RMEM_DEFAULT=`restore_value net.core.rmem_default`
        RMEM_MAX=`restore_value net.core.rmem_max`
        WMEM_DEFAULT=`restore_value net.core.wmem_default`
        WMEM_MAX=`restore_value net.core.wmem_max`
        PANIC_ON_OOPS=`restore_value kernel.panic_on_oops`
        [ "$SHMALL" ] && sysctl -w kernel.shmall="$SHMALL"
        [ "$SHMMAX" ] && sysctl -w kernel.shmmax="$SHMMAX"
        [ "$SHMMNI" ] && sysctl -w kernel.shmmni="$SHMMNI"
        [ "$SWAPPINESS" ] && sysctl -w vm.swappiness="$SWAPPINESS"
        [ "$DIRTY_BCKGRD_RATIO" ] && sysctl -w vm.dirty_background_ratio="$DIRTY_BCKGRD_RATIO"
        [ "$DIRTY_EXPIRE_CENTISECS" ] && sysctl -w vm.dirty_expire_centisecs="$DIRTY_EXPIRE_CENTISECS"
        [ "$FILE_MAX" ] && sysctl -w fs.file-max="$FILE_MAX"
        [ "$LCL_PRT_RNG" ] && sysctl -w net.ipv4.ip_local_port_range="$LCL_PRT_RNG"
        [ "$RMEM_DEFAULT" ] && sysctl -w net.core.rmem_default="$RMEM_DEFAULT"
        [ "$RMEM_MAX" ] && sysctl -w net.core.rmem_max="$RMEM_MAX"
        [ "$WMEM_DEFAULT" ] && sysctl -w net.core.wmem_default="$WMEM_DEFAULT"
        [ "$WMEM_MAX" ] && sysctl -w net.core.wmem_max="$WMEM_MAX"
  	[ "$PANIC_ON_OOPS" ] && sysctl -w kernel.panic_on_oops="$PANIC_ON_OOPS"
        return 0
}
process $@

