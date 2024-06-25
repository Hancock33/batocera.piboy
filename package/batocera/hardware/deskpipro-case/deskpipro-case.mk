################################################################################
#
# deskpipro-case
#
################################################################################
# Version: Commits on Jun 25, 2024
DESKPIPRO_CASE_VERSION = 909174d02da9bbb728b6bba1b2f1c3d86a08d9ec
DESKPIPRO_CASE_SITE = $(call github,DeskPi-Team,deskpi,$(DESKPIPRO_CASE_VERSION))
DESKPIPRO_CASE_LICENSE = GPL-3.0+
DESKPIPRO_CASE_DEPENDENCIES = lirc-tools

define DESKPIPRO_CASE_BUILD_CMDS
	#$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/drivers/c/fanStop $(@D)/drivers/c/fanStop.c
	$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/drivers/c/pwmFanControl $(@D)/drivers/c/pwmControlFan.c
	$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/drivers/c/safecutoffpower $(@D)/drivers/c/safecutoffpower.c
endef

define DESKPIPRO_CASE_INSTALL_TARGET_CMDS
	#$(INSTALL) -D -m 0755 $(@D)/drivers/c/fanStop $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/drivers/c/pwmFanControl $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/drivers/c/safecutoffpower $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
