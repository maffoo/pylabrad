#!/bin/sh

### BEGIN INIT INFO
# Provides: labradcontrol
# Required-Start: $network
# Required-Stop: $network
# Default-Start: 3 4 5
# Default-Stop: 0 1 2 6
# Short-Description: Provides a web interface for controlling a LabRAD network.
# Description: Provides a web interface for controlling a LabRAD network.
### END INIT INFO

case "$1" in
    'start')
        echo "Starting labradcontrol..."
        mkdir /var/run/labrad
        mkdir /var/log/labrad
        twistd --pidfile /var/run/labrad/control.pid --logfile /var/log/labrad/control.log labradcontrol
        ;;
        
    'stop')
        echo "Stopping labradcontrol..."
        kill `cat /var/run/labrad/control.pid`
        ;;
        
    'restart')
        $0 stop
        $0 start
        ;;
        
    *)
        echo "Usage: $0 { start | stop }"
        ;;
esac

# TODO: add status, try-restart, reload, force-reload

exit 0