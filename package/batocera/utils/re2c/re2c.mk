################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 22, 2024
RE2C_VERSION = a75eb2b3fd5f0518aa93d62f6f61ed63d392d032
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
