################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Mar 10, 2026
HID_TMFF2_VERSION = 8187920ed261c7024826f8204cc7bea45153a3da
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
