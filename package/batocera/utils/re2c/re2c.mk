################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Jul 19, 2024
RE2C_VERSION = f2395c299886cfc5639f841f6445ab9ad0fa26f9
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
