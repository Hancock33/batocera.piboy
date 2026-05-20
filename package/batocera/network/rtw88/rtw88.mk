################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on May 20, 2026
RTW88_VERSION = 74e7d03cec5b278a0475b30e80cb8af204ba2c2b
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
	CONFIG_RTW88=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
