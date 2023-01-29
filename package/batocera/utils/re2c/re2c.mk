################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Jan 11, 2023
RE2C_VERSION = 8df0ed673737a32a227533743b0cf4b0d4c7c528
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))

define RE2C_AUTOGEN
    cd $(@D); ./autogen.sh
endef

RE2C_PRE_CONFIGURE_HOOKS += RE2C_AUTOGEN
HOST_RE2C_PRE_CONFIGURE_HOOKS += RE2C_AUTOGEN

$(eval $(autotools-package))
$(eval $(host-autotools-package))
