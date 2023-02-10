################################################################################
#
# xpad-noone
#
################################################################################
# Version: Commits on Dec 27, 2022
XPAD_NOONE_VERSION = d02737f7eab1e17a7748fbe550dd982e3808525d
XPAD_NOONE_SITE = $(call github,medusalix,xpad-noone,$(XPAD_NOONE_VERSION))
XPAD_NOONE_DEPENDENCIES = host-cabextract libusb

XPAD_NOONE_USER_EXTRA_CFLAGS = -w -Wno-error=unused-function

XPAD_NOONE_MODULE_MAKE_OPTS = \
	KCFLAGS="$$KCFLAGS $(XPAD_NOONE_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
