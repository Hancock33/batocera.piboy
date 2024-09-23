################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Sept 23, 2024
RE2C_VERSION = 5c84dfc5aadc411808d6996d3ce47638962eb734
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
