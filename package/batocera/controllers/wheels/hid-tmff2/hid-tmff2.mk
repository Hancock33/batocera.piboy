################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Feb 08, 2026
HID_TMFF2_VERSION = f004195a73be722f6384ecae7d98161481151dff
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
