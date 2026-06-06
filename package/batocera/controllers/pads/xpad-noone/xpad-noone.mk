################################################################################
#
# xpad-noone
#
################################################################################
# Version: Commits on Jun 05, 2026
XPAD_NOONE_VERSION = a52e32cf182435d608e66bef9a6c89ebac891999
XPAD_NOONE_SITE = $(call github,forkymcforkface,xpad-noone,$(XPAD_NOONE_VERSION))
XPAD_NOONE_DEPENDENCIES = host-cabextract libusb

$(eval $(kernel-module))
$(eval $(generic-package))
