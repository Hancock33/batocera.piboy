################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 23, 2024
RE2C_VERSION = 162b9c5a8b55937a0f080e1d7905d4432bb9765e
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
