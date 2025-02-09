################################################################################
#
# rtl8821au-morrownr
#
################################################################################
# Version: Commits on Feb 09, 2025
RTL8821AU_MORROWNR_VERSION = 54204dda4f3e88b791370db41d7da3ace8a693a0
RTL8821AU_MORROWNR_SITE = $(call github,morrownr,8821au-20210708,$(RTL8821AU_MORROWNR_VERSION))
RTL8821AU_MORROWNR_LICENSE = GPL-2.0
RTL8821AU_MORROWNR_LICENSE_FILES = LICENSE

RTL8821AU_MORROWNR_MODULE_MAKE_OPTS = \
	CONFIG_RTL8821AU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

define RTL8821AU_MORROWNR_MAKE_SUBDIR
	(cd $(@D); ln -s . RTL8821AU)
endef

RTL8821AU_MORROWNR_PRE_CONFIGURE_HOOKS += RTL8821AU_MORROWNR_MAKE_SUBDIR

$(eval $(kernel-module))
$(eval $(generic-package))
