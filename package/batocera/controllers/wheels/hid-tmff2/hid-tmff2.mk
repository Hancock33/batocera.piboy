################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Nov 03, 2025
HID_TMFF2_VERSION = 5095d47320c36e2346d41eb7e35dcbd215886557
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
