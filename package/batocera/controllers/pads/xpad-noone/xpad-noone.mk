################################################################################
#
# xpad-noone
#
################################################################################
# Version: Commits on Feb 27, 2026
XPAD_NOONE_VERSION = 7b5361475c719b03b9e0152e44cf7fca0b85af60
XPAD_NOONE_SITE = $(call github,forkymcforkface,xpad-noone,$(XPAD_NOONE_VERSION))
XPAD_NOONE_DEPENDENCIES = host-cabextract libusb

$(eval $(kernel-module))
$(eval $(generic-package))
