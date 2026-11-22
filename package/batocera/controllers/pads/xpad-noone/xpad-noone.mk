################################################################################
#
# xpad-noone
#
################################################################################
# Version: Commits on Nov 10, 2026
XPAD_NOONE_VERSION = bc5faaaa72e01129fd10cbb42e8a996d46d2fa8a
XPAD_NOONE_SITE = $(call github,forkymcforkface,xpad-noone,$(XPAD_NOONE_VERSION))
XPAD_NOONE_LICENSE = GPL-2.0+
XPAD_NOONE_DEPENDENCIES = host-cabextract libusb

$(eval $(kernel-module))
$(eval $(generic-package))
