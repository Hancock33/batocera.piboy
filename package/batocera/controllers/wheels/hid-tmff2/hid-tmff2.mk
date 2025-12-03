################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Dec 01, 2025
HID_TMFF2_VERSION = c4b70d4ec36404c9454199bec208eaf3116ef453
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
