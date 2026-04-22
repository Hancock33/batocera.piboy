################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Apr 15, 2026
RTW88_VERSION = d899bb669b8c5a4ecd1328c0438e54ad2d6bfa83
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
	CONFIG_RTW88=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
