################################################################################
#
# xxd
#
################################################################################
# Version: Commits on Aug 06, 2024
XXD_VERSION = v1.2
XXD_SITE =  $(call github,ckormanyos,xxd,$(XXD_VERSION))

define XXD_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/xxd $(TARGET_DIR)/usr/bin/xxd
endef

define HOST_XXD_INSTALL_CMDS
	$(INSTALL) -D $(@D)/xxd $(HOST_DIR)/bin/xxd
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
