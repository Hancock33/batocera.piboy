################################################################################
#
# rtl8821cu
#
################################################################################
# Version: Commits on Nov 10, 2022
RTL8821CU_VERSION = dfec08a31570e351e3b634d5efbd89e5f3e69e44
RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
RTL8821CU_LICENSE = GPL-2.0
RTL8821CU_LICENSE_FILES = LICENSE

RTL8821CU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8821CU=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

define RTL8821CU_MAKE_SUBDIR
        (cd $(@D); ln -s . RTL8821CU)
endef

RTL8821CU_PRE_CONFIGURE_HOOKS += RTL8821CU_MAKE_SUBDIR

$(eval $(kernel-module))
$(eval $(generic-package))
