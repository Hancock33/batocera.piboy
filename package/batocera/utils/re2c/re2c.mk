################################################################################
#
# re2c
#
################################################################################
# Version: Commits on Nov 10, 2024
RE2C_VERSION = c4e779cab5596ff326acbecac33fea9bd5b4a184
RE2C_SITE =  $(call github,skvadrik,re2c,$(RE2C_VERSION))
RE2C_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
