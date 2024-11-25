################################################################################
#
# new-lg4ff
#
################################################################################
# Version: Commits on Nov 18, 2024
NEW_LG4FF_VERSION = 6100a34c182536c607af80e119d54a66c6fb2a23
NEW_LG4FF_SITE = $(call github,berarma,new-lg4ff,$(NEW_LG4FF_VERSION))

NEW_LG4FF_MODULE_MAKE_OPTS = KCFLAGS="$$KCFLAGS $(NEW_LG4FF_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
