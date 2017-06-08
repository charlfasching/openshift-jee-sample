#!/bin/sh
SERVICE_NAME=swarmd
PATH_TO_JAR=/usr/lib/swarm.jar
PID_PATH_NAME=/tmp/${SERVICE_NAME}-pid
case $1 in
    status)
        echo "Checking status $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then            
            echo "$SERVICE_NAME not Running ..."
        else
            echo "$SERVICE_NAME is Running ..."
        fi
    ;;
    start)
        echo "Starting $SERVICE_NAME ..."
        if [ ! -f $PID_PATH_NAME ]; then
            nohup java -jar $PATH_TO_JAR  2>&1 >> /var/log/swarm.log  &
            echo $! > $PID_PATH_NAME
            
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is already running ..."
        fi
    ;;
    stop)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stoping ..."
            kill $PID;
            echo "$SERVICE_NAME stopped ..."
            rm $PID_PATH_NAME
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
    restart)
        if [ -f $PID_PATH_NAME ]; then
            PID=$(cat $PID_PATH_NAME);
            echo "$SERVICE_NAME stopping ...";
            kill $PID;
            echo "$SERVICE_NAME stopped ...";
            rm $PID_PATH_NAME
            echo "$SERVICE_NAME starting ..."
            nohup java -jar $PATH_TO_JAR 2>&1 >> /var/log/swarm.log &
            echo $! > $PID_PATH_NAME
            echo "$SERVICE_NAME started ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac 