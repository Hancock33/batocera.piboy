################################################################################
#
# liburc
#
################################################################################

LIBURCU_VERSION = 0.7.6
LIBURCU_SITE    = http://lttng.org/files/urcu/
LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2

LIBURCU_INSTALL_STAGING = YES

$(eval $(autotools-package))
