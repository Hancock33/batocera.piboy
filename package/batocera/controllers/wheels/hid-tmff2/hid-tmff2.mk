################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Aug 08, 2026
HID_TMFF2_VERSION = 9d8577ba2a2c8e3d96cfdb7be4201e4e230e210f
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
