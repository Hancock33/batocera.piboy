################################################################################
#
# deskpipro-case
#
################################################################################
# Version: Commits on Nov 30, 2023
DESKPIPRO_CASE_VERSION = 9c712644f7a428fb0957ac193577ff89cfe9e07c
DESKPIPRO_CASE_SITE = $(call github,DeskPi-Team,deskpi,$(DESKPIPRO_CASE_VERSION))
DESKPIPRO_CASE_LICENSE = GPL-3.0+
DESKPIPRO_CASE_DEPENDENCIES = lirc-tools

define DESKPIPRO_CASE_BUILD_CMDS
	$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/drivers/c/fanStop $(@D)/drivers/c/fanStop.c
	$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/drivers/c/pwmFanControl $(@D)/drivers/c/pwmControlFan.c
	$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/drivers/c/safecutoffpower $(@D)/drivers/c/safecutoffpower.c
endef

define DESKPIPRO_CASE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/drivers/c/fanStop $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/drivers/c/pwmFanControl $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/drivers/c/safecutoffpower $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
