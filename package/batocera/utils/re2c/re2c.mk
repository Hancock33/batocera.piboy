################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 04, 2024
RE2C_VERSION = 0dfc64d6fff60713ea460fc479e115e4f027c9cb
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
