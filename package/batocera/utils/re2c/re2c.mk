################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 14, 2024
RE2C_VERSION = cf7e2c76397159c666a97bea208e69af029f5817
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
