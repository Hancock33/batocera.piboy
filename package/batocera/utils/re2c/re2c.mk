################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Oct 24, 2024
RE2C_VERSION = 3f0f46ff75e15e68abeb1a62de5bc55acb084988
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
