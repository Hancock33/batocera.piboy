################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Aug 19, 2025
RTW88_VERSION = c691baf45758ad47e2295a561b477755e7ca5f35
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
