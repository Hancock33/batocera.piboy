################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Apr 12, 2025
HID_TMFF2_VERSION = 2661098c3ddaa327b0db8029689f7dfb6e85d1e9
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
