################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Apr 24, 2024
RE2C_VERSION = 671fc0bc08af8f06df3ed59c3294f0920d5b5184
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))

define RE2C_AUTOGEN
	cd $(@D); ./autogen.sh
endef

RE2C_PRE_CONFIGURE_HOOKS += RE2C_AUTOGEN
HOST_RE2C_PRE_CONFIGURE_HOOKS += RE2C_AUTOGEN

$(eval $(autotools-package))
$(eval $(host-autotools-package))
