################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Feb 12, 2026
RTW88_VERSION = 4e777cb6088f95c16ab3da9458ef78db43010d04
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
