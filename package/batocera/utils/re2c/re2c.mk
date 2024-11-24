################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 23, 2024
RE2C_VERSION = 5eb464f8e89be47831568e0419cb8ed33f56a9fc
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
