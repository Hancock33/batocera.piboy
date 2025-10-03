################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Oct 03, 2025
HID_TMFF2_VERSION = 438a3e1407565dbd1d8ceb3981f4830a723a3c3c
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
