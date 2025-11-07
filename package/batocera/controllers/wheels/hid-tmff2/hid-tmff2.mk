################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Nov 07, 2025
HID_TMFF2_VERSION = 2a7b3568792d50e94479298b5d0e5602d4e230f8
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
