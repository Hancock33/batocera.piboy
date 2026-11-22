################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Nov 10, 2026
HID_TMFF2_VERSION = 7a1274d25b2304deed326c5a43bf3617fedcb990
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))
HID_TMFF2_LICENSE = GPL-3.0
HID_TMFF2_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
