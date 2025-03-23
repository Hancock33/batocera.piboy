################################################################################
#
# bigpemu
#
################################################################################
# Version: Commits on Jan 27, 2024
BIGPEMU_VERSION = v118
BIGPEMU_SOURCE = BigPEmu_Linux64_$(BIGPEMU_VERSION).tar.gz
BIGPEMU_SITE = https://www.richwhitehouse.com/jaguar/builds

define BIGPEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/bigpemu
	cp -pr $(@D)/* $(TARGET_DIR)/usr/bin/bigpemu/
endef

$(eval $(generic-package))
