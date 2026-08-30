################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Aug 29, 2026
RE2C_VERSION = 4.6
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
