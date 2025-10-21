################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Oct 19, 2025
RTW88_VERSION = 9bc8fecb61d4ad59e46b4dbd003d60ef2d8437a8
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
