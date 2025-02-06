################################################################################
#
# new-lg4ff
#
################################################################################
# Version: Commits on Feb 06, 2025
NEW_LG4FF_VERSION = 3f7739c251fa63ef7006a6cf584c394118298b34
NEW_LG4FF_SITE = $(call github,berarma,new-lg4ff,$(NEW_LG4FF_VERSION))

NEW_LG4FF_MODULE_MAKE_OPTS = KCFLAGS="$$KCFLAGS $(NEW_LG4FF_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
