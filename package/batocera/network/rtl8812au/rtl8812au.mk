################################################################################
#
# rtl8812au
#
################################################################################
# Version: Commits on Feb 20, 2025
RTL8812AU_VERSION = 2317f49f3c4e7482638a0e9b461eed495c05219b
RTL8812AU_SITE = $(call github,morrownr,8812au-20210820,$(RTL8812AU_VERSION))
RTL8812AU_LICENSE = GPL-2.0
RTL8812AU_LICENSE_FILES = LICENSE

RTL8812AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8812AU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

define RTL8812AU_MAKE_SUBDIR
	(cd $(@D); ln -s . RTL8812AU)
endef

RTL8812AU_PRE_CONFIGURE_HOOKS += RTL8812AU_MAKE_SUBDIR

$(eval $(kernel-module))
$(eval $(generic-package))
