################################################################################
#
# xpad-noone
#
################################################################################
# Version: Commits on Jan 23, 2022
XPAD_NOONE_VERSION = d9974e0f03bfb90ad0cf783a59de8e8f14c1a8e8
XPAD_NOONE_SITE = $(call github,medusalix,xpad-noone,$(XPAD_NOONE_VERSION))
XPAD_NOONE_DEPENDENCIES = host-cabextract libusb

$(eval $(kernel-module))
$(eval $(generic-package))
