################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Apr 22, 2025
HID_TMFF2_VERSION = d4c9e065ca41b30e1cb7a9852ba182b53a669b9c
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
