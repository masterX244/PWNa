#!/bin/sh

. /usr/bin/sena_wifi_tools/func.sh

app_start() {
	echo "sena app start"
	#$RUN_PATH/sena_service.capp 2> /dev/null &
	$RUN_PATH/sena_service.capp &
}

app_stop() {
	echo "sena app stop"
	killall sena_service.capp
}

app_restart() {
	#echo "sena app restart"
	app_stop
	sleep 5
	bin_prepare
	app_start
}

case "$1" in
	start)
		app_start
		;;

	stop)
		app_stop
		;;

	restart|reload)
		app_restart
		;;

	boot)
		echo 1 > /proc/sys/kernel/printk

		if [ $USB_SWITCH == 1 ]; then
			cmd_gpio set_func pc4 output0
		fi

		if [ $UART0_RESET == 1 ]; then
			cmd_gpio set_func pb22 input pull_down
		fi

		killall dhcpcd
		/usr/sbin/boa
		$CRADLE_PATH/ipds --port 2050 &
		prepare_userdata

        run-parts /usr/data/PWNa/earlyinit.d/
        
		if [ $BOOT_LED == 1 ]; then
			cmd_gpio set_func pc6 output1
			cmd_gpio set_func pc7 output1
		fi
		app_start
		sleep 1;
		/tmp/ap_util.capp ap_init &
        run-parts /usr/data/PWNa/init.d/
		;;

	*)
		echo "Usage: $0 {start|stop|restart|reload|boot}"
		exit 1
esac