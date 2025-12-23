################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Dec 19, 2025
RTW88_VERSION = 3e03f9a20a39b284a3b924294c6566ac81a48a33
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
