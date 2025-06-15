################################################################################
#
# rtl8852au
#
################################################################################
# Version: Commits on Jun 14, 2025
RTL8852AU_VERSION = 708c17801ba3f83734e6d8cc39b74d1d528489f8
RTL8852AU_SITE = $(call github,natimerry,rtl8852au,$(RTL8852AU_VERSION))
RTL8852AU_LICENSE = GPL-2.0
RTL8852AU_LICENSE_FILES = LICENSE

RTL8852AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8852AU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error -I$(@D)/core/crypto -I$(@D)/os_dep/linux"

$(eval $(kernel-module))
$(eval $(generic-package))
