################################################################################
#
# bigpemu
#
################################################################################
# Version: Commits on Jun 02, 2025
BIGPEMU_VERSION = v119
BIGPEMU_SOURCE = BigPEmu_$(BIGPEMU_ARCH)_$(BIGPEMU_VERSION).tar.gz
BIGPEMU_SITE = https://www.richwhitehouse.com/jaguar/builds

ifeq ($(BR2_aarch64),y)
    BIGPEMU_ARCH = LinuxARM64
else
    BIGPEMU_ARCH = Linux64
endif

define BIGPEMU_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/bigpemu
	mkdir -p $(TARGET_DIR)/usr/bin/bigpemu
	cp -av $(@D)/* $(TARGET_DIR)/usr/bin/bigpemu/
endef

$(eval $(generic-package))
