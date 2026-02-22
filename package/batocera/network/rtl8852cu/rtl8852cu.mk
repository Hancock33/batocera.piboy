################################################################################
#
# rtl8852cu
#
################################################################################
# Version: Commits on Feb 17, 2026
RTL8852CU_VERSION = d4163de3f901e746acd20322fc324d0a95ca66c1
RTL8852CU_SITE = $(call github,morrownr,rtl8852cu-20240510,$(RTL8852CU_VERSION))
RTL8852CU_LICENSE = GPL-2.0
RTL8852CU_LICENSE_FILES = LICENSE

RTL8852CU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8852CU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error -I$(@D)/core/crypto -I$(@D)/os_dep/linux"

$(eval $(kernel-module))
$(eval $(generic-package))
