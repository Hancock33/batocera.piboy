#############################################################
#
# netstat-nat
#
#############################################################

NETSTAT_NAT_VERSION = 1.4.9
NETSTAT_NAT_SOURCE = netstat-nat-$(NETSTAT_NAT_VERSION).tar.gz
NETSTAT_NAT_SITE = http://tweegy.nl/download

$(eval $(call AUTOTARGETS,package,netstat-nat))
