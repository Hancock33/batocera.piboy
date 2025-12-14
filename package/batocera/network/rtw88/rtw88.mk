################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Dec 06, 2025
RTW88_VERSION = 3bc79b254235b9187866d0293de8e46ae1d439a0
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
