################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Dec 20, 2025
RTW88_VERSION = 4fbc3483838c0e7f9eab8432634357c4c2589e31
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
