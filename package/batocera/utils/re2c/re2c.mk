################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Jul 08, 2024
RE2C_VERSION = d3f727cd8c0910f5371f6b84a356fc53c0c8bce6
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
