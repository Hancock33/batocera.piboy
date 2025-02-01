################################################################################
#
# rtl88x2bu
#
################################################################################
# Version: Commits on Feb 01, 2025
RTL88X2BU_VERSION = 37e8585e9155514ea8beff8c51517e56c60a7510
RTL88X2BU_SITE = $(call github,morrownr,88x2bu-20210702,$(RTL88X2BU_VERSION))
RTL88X2BU_LICENSE = GPL-2.0
RTL88X2BU_LICENSE_FILES = LICENSE

RTL88X2BU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8822BU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

define RTL88X2BU_MAKE_SUBDIR
	(cd $(@D); ln -s . rtl88x2bu)
endef

RTL88X2BU_PRE_CONFIGURE_HOOKS += RTL88X2BU_MAKE_SUBDIR

$(eval $(kernel-module))
$(eval $(generic-package))
