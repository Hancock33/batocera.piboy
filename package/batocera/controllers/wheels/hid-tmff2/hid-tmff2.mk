################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Jan 20, 2026
HID_TMFF2_VERSION = 816a23aa8f6924517bf784f3d72fbae42f100493
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
