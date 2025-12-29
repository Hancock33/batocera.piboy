################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Dec 28, 2025
RTW88_VERSION = 2dd31d98c8a26e156f06bbcfb7a957fb452e2f83
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
