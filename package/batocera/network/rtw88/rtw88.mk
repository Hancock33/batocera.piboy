################################################################################
#
# rtw88
#
################################################################################
# Version: Commits on Dec 16, 2025
RTW88_VERSION = daa670ac514e3d9f2e147ec2d8d627b156e77f2c
RTW88_SITE = $(call github,lwfinger,rtw88,$(RTW88_VERSION))

RTW88_MODULE_MAKE_OPTS = \
    CONFIG_RTW88=m \
    USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
