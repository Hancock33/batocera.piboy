################################################################################
#
# rtl8852cu
#
################################################################################
# Version: Commits on Apr 08, 2026
RTL8852CU_VERSION = f24a6af19b24e8462f940e76455aebffbdd1537f
RTL8852CU_SITE = $(call github,morrownr,rtl8852cu-20251113,$(RTL8852CU_VERSION))
RTL8852CU_LICENSE = GPL-2.0
RTL8852CU_LICENSE_FILES = LICENSE

RTL8852CU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8852CU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error -I$(@D)/core/crypto -I$(@D)/os_dep/linux"

$(eval $(kernel-module))
$(eval $(generic-package))
