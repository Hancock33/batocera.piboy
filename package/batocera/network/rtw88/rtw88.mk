################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on May 21, 2026
RTW88_VERSION = a56bcd26e770257612a0803249cbd4095fc6feca
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
	CONFIG_RTW88=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
