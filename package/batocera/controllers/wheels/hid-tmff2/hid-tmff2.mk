################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Jul 28, 2025
HID_TMFF2_VERSION = e0a173f3265be8efcbd4a6f34df6c5713d988b15
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
