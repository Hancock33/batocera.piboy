#############################################################
#
# neard
#
#############################################################

NEARD_VERSION = 0.9
NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
NEARD_LICENSE = GPLv2
NEARD_LICENSE_FILES = COPYING

NEARD_AUTORECONF = YES
NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
NEARD_CONF_OPT = --disable-traces

$(eval $(autotools-package))
