################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 21, 2024
RE2C_VERSION = 92c3ae5a99651e8cc7fb457057ff0c92061cb5f6
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
