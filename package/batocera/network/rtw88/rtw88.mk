################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Apr 24, 2026
RTW88_VERSION = 8ed63327db711d0fd03cb569d43a1f814a5a94b4
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
	CONFIG_RTW88=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
