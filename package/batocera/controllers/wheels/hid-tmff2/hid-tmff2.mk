################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Aug 18, 2026
HID_TMFF2_VERSION = c6157ea211dbebbac5ac6abad1aba74c86cde759
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
