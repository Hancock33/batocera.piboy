################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Aug 05, 2025
RTW88_VERSION = 52072d874840f28c247b27f5d799f2c5c88a7e61
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
