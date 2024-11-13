################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 13, 2024
RE2C_VERSION = a5e37dcb8a594f7998cdbb30a99929ce7a23cc56
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
