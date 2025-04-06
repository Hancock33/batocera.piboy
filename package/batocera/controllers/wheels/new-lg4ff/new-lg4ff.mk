################################################################################
#
# new-lg4ff
#
################################################################################
# Version: Commits on Apr 04, 2025
NEW_LG4FF_VERSION = 7b7c192440ef0f9d762b5a4c320ad75f6c05e6b2
NEW_LG4FF_SITE = $(call github,berarma,new-lg4ff,$(NEW_LG4FF_VERSION))

NEW_LG4FF_MODULE_MAKE_OPTS = KCFLAGS="$$KCFLAGS $(NEW_LG4FF_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
