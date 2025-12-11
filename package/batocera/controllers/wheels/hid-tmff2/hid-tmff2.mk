################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Dec 11, 2025
HID_TMFF2_VERSION = 26995429a3b92047f0c2f9ab90fe4202c86fd72b
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
