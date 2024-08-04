################################################################################
#
# rtl8812au
#
################################################################################
# Version: Commits on Jul 30, 2024
RTL8812AU_VERSION = a88228be6215bd44c8c29792e240ac05387e8e20
RTL8812AU_SITE = $(call github,morrownr,8812au-20210820,$(RTL8812AU_VERSION))
RTL8812AU_LICENSE = GPL-2.0
RTL8812AU_LICENSE_FILES = LICENSE

RTL8812AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8812AU=m \
# batocera: setting KVER breaks top level parallelization
	#KVER=$(LINUX_VERSION_PROBED)
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN -Wno-error"

define RTL8812AU_MAKE_SUBDIR
	(cd $(@D); ln -s . RTL8812AU)
endef

RTL8812AU_PRE_CONFIGURE_HOOKS += RTL8812AU_MAKE_SUBDIR

$(eval $(kernel-module))
$(eval $(generic-package))
