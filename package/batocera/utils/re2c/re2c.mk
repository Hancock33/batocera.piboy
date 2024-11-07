################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 07, 2024
RE2C_VERSION = a2d53615456605ec2acddf14631c6308a98d2f98
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
