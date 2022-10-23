################################################################################
#
# rtl8821cu
#
################################################################################
# Version: Commits on Oct 19, 2022
RTL8821CU_VERSION = 0dbe1ad7900a06a95904db2ef0d93835c884dd67
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
