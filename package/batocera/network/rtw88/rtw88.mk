################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Nov 30, 2025
RTW88_VERSION = 3309c45c283cbd996e1e05eeddf90c4fa589b90b
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
