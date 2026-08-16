################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Aug 09, 2026
HID_TMFF2_VERSION = c5b9b79d4e61b77e0827e81dd676420b3c366743
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
