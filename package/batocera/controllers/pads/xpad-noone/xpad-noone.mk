################################################################################
#
# xpad-noone
#
################################################################################
# Version: Commits on Apr 24, 2024
XPAD_NOONE_VERSION = 6970c40930bedd8b58d0764894e0d5f04813b7c5
XPAD_NOONE_SITE = $(call github,medusalix,xpad-noone,$(XPAD_NOONE_VERSION))
XPAD_NOONE_DEPENDENCIES = host-cabextract libusb

XPAD_NOONE_USER_EXTRA_CFLAGS = -w -Wno-error=unused-function

XPAD_NOONE_MODULE_MAKE_OPTS = \
	KCFLAGS="$$KCFLAGS $(XPAD_NOONE_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
