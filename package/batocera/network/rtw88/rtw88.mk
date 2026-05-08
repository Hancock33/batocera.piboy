################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Mar 19, 2026
RTW88_VERSION = 274f0d866576c4a8c51ad453a1a32f018c0b16c3
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
	CONFIG_RTW88=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
