################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Jun 13, 2024
RE2C_VERSION = 6841306953a675e75999217842214a40f9f31df8
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
