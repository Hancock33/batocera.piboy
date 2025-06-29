################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Jun 28, 2025
HID_TMFF2_VERSION = 49adf5c48ba2784d97384619a52e875daf4bc062
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
