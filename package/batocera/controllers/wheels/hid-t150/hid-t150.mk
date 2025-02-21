################################################################################
#
# hid-t150
#
################################################################################
# Version: Commits on Feb 21, 2025
HID_T150_VERSION = 8266ddd9742cb11289c2b23054ea0338911f6dcb
HID_T150_SITE = $(call github,scarburato,t150_driver,$(HID_T150_VERSION))
HID_T150_MODULE_SUBDIRS = hid-t150

$(eval $(kernel-module))
$(eval $(generic-package))
