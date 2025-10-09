################################################################################
#
# rtl8852au
#
################################################################################
# Version: Commits on Oct 08, 2025
RTL8852AU_VERSION = 5224a68597bca02fc49fea7a2bc0bfa2ec554b8d
RTL8852AU_SITE = $(call github,pulponair,rtl8852au,$(RTL8852AU_VERSION))
RTL8852AU_LICENSE = GPL-2.0
RTL8852AU_LICENSE_FILES = LICENSE

RTL8852AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8852AU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error -I$(@D)/core/crypto -I$(@D)/os_dep/linux"

$(eval $(kernel-module))
$(eval $(generic-package))
