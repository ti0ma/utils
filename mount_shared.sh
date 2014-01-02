#!/bin/bash
DEST_FOLDER="/home/tioma/dev"

start() {
        echo "TIOMA---> Mounting the shared folders"
        if [ ! -d "$DEST_FOLDER" ]; then
                mkdir -p "$DEST_FOLDER"
        fi
        mount -t vmhgfs .host:/ "$DEST_FOLDER"
}

stop() {
        echo "TIOMA---> Unmounting the shared folders"
        if [ -d "$DEST_FOLDER" ]; then
                umount "$DEST_FOLDER"
                rm -rf "$DEST_FOLDER"
        fi
}

status() {
        if [ -d "$DEST_FOLDER" ]; then
                echo "The filesystem is mounted"
        else
                echo "The filesystem doesn't exist"
        fi
}


case "$1" in
        start)
                start
                ;;
        stop)
                stop
                ;;
        status)
                status
                ;;
        retart)
                stop
                start
                ;;
        *)
                echo "Usage: $0 {start|stop|restart|status}"
esac

exit 0
