################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Aug 29, 2025
RTW88_VERSION = bb0ed9d5709afd30e928d2d11f7b650e03c8c72b
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
