################################################################################
#
# rtl8852cu
#
################################################################################
# Version: Commits on Feb 16, 2026
RTL8852CU_VERSION = 1f7343f89b67a1bbae79c7647eabed7f9bb78537
RTL8852CU_SITE = $(call github,morrownr,rtl8852cu-20251113,$(RTL8852CU_VERSION))
RTL8852CU_LICENSE = GPL-2.0
RTL8852CU_LICENSE_FILES = LICENSE

RTL8852CU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8852CU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error -I$(@D)/core/crypto -I$(@D)/os_dep/linux"

$(eval $(kernel-module))
$(eval $(generic-package))
