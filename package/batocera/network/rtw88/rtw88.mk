################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Apr 27, 2026
RTW88_VERSION = 4ef9d994294afc45ea824b7403261ac0ac6ceca2
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
	CONFIG_RTW88=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
