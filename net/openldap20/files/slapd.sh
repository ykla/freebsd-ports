#!/bin/sh
#
# $FreeBSD$

slapd_program=@@PREFIX@@/libexec/slapd

# Uncomment one of the following:
#
# IPv4 Only
#slapd_args='-h ldap://0.0.0.0'
#
# IPv6 and IPv4
#slapd_ags='-h "ldap://[::] ldap://0.0.0.0"'
#
# IPv6 Only
#slapd_args='-h ldap://[::]'
#
# Add '-u ldap -g ldap' when you do not want to run
# slapd as root
#
slapd_args=

pidfile=@@LDAP_RUN_DIR@@/slapd.pid

case "$1" in
start)
    if [ -x ${slapd_program} ]; then
	echo -n ' slapd'
	eval ${slapd_program} ${slapd_args}

    fi
    ;;
stop)
    if [ -f $pidfile ]; then
	kill `cat $pidfile`
	telnet localhost ldap </dev/null >/dev/null 2>&1
	echo -n ' slapd'
	rm $pidfile
    else
	echo ' slapd: not running'
    fi
    ;;
*)
    echo "Usage: `basename $0` {start|stop}" >&2
    exit 64
    ;;
esac

exit 0
