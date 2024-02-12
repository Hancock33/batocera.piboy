################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Jan 31, 2024
RE2C_VERSION = 9885ee7119c6cf00bfeb9c466e4b34bdfa4eb88f
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))

define RE2C_AUTOGEN
	cd $(@D); ./autogen.sh
endef

RE2C_PRE_CONFIGURE_HOOKS += RE2C_AUTOGEN
HOST_RE2C_PRE_CONFIGURE_HOOKS += RE2C_AUTOGEN

$(eval $(autotools-package))
$(eval $(host-autotools-package))
