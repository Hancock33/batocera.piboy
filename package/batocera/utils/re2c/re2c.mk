################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Oct 31, 2024
RE2C_VERSION = cffecf2bc5f3dc95183a2880bccab0deb1b0c1c6
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
