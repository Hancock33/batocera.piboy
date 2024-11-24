################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 24, 2024
RE2C_VERSION = 61c88fbf5ad4b34956c2c42331d1812f215502fe
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
