################################################################################
#
# xpad-noone
#
################################################################################
# Version: Commits on Jun 26, 2025
XPAD_NOONE_VERSION = 8e903676dd9514c07ce5e06e43c5f7d8cc51cb7d
XPAD_NOONE_SITE = $(call github,forkymcforkface,xpad-noone,$(XPAD_NOONE_VERSION))
XPAD_NOONE_DEPENDENCIES = host-cabextract libusb

XPAD_NOONE_USER_EXTRA_CFLAGS = -w -Wno-error=unused-function

XPAD_NOONE_MODULE_MAKE_OPTS = \
	KCFLAGS="$$KCFLAGS $(XPAD_NOONE_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
