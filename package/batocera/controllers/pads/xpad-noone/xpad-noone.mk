################################################################################
#
# xpad-noone
#
################################################################################
# Version: Commits on Feb 27, 2026
XPAD_NOONE_VERSION = 3a85b3359f564d2aa13dca09bde85e3d6544722c
XPAD_NOONE_SITE = $(call github,forkymcforkface,xpad-noone,$(XPAD_NOONE_VERSION))
XPAD_NOONE_DEPENDENCIES = host-cabextract libusb

$(eval $(kernel-module))
$(eval $(generic-package))
