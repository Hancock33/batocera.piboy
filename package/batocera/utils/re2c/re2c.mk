################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Apr 24, 2024
RE2C_VERSION = 671fc0bc08af8f06df3ed59c3294f0920d5b5184
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))

RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
