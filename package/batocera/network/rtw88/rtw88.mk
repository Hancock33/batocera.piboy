################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Dec 14, 2025
RTW88_VERSION = d61b2c2366060818c2e6a3f2ed8959b52a8d0ec1
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
