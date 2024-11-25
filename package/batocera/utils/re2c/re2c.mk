################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 25, 2024
RE2C_VERSION = e5cb9a1ebd9efab6604930b9f773fd684df6edd5
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
