################################################################################
#
# hid-tmff2
#
################################################################################
# Version: Commits on Nov 22, 2026
HID_TMFF2_VERSION = de19c2c3a18e9d1d3dc4e89eae13d8413e3353d2
HID_TMFF2_SITE = $(call github,Kimplul,hid-tmff2,$(HID_TMFF2_VERSION))
HID_TMFF2_LICENSE = GPL-3.0
HID_TMFF2_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
