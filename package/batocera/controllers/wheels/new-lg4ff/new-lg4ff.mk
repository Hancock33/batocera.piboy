################################################################################
#
# new-lg4ff
#
################################################################################
# Version: Commits on Jun 18, 2024
NEW_LG4FF_VERSION = 1a2d5727876dd7befce23d9695924e9446b31c4b
NEW_LG4FF_SITE = $(call github,berarma,new-lg4ff,$(NEW_LG4FF_VERSION))

$(eval $(kernel-module))
$(eval $(generic-package))
