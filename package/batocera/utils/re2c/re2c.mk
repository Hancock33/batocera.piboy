################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 19, 2024
RE2C_VERSION = b8a4cddf80692486e8780d2a3ffc8a7e82acebbc
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
