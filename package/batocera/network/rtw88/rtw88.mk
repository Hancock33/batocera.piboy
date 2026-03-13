################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Mar 09, 2026
RTW88_VERSION = d2258b4de21aeabf7ef85ec0cada1f3cff9bcbe0
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
	CONFIG_RTW88=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
