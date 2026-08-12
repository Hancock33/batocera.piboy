################################################################################
#
# x86-64-level
#
################################################################################
# Version: Commits on Aug 09, 2026
X86_64_LEVEL_VERSION = 0.3.0
X86_64_LEVEL_SITE = $(call github,HenrikBengtsson,x86-64-level,$(X86_64_LEVEL_VERSION))
X86_64_LEVEL_LICENSE = BY-SA

define X86_64_LEVEL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/x86-64-level $(TARGET_DIR)/usr/bin/x86-64-level
	$(INSTALL) -m 0755 $(X86_64_LEVEL_PKGDIR)/batocera-x64-compatibility \
	    $(TARGET_DIR)/usr/bin/batocera-x64-compatibility
endef

$(eval $(generic-package))
