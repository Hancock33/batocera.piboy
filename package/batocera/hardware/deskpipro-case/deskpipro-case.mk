################################################################################
#
# deskpipro-case
#
################################################################################
# Version: Commits on Oct 25, 2024
DESKPIPRO_CASE_VERSION = 923de3203a000f8d8ffefb5ca15d296eb5d3c425
DESKPIPRO_CASE_SITE = $(call github,DeskPi-Team,deskpi,$(DESKPIPRO_CASE_VERSION))
DESKPIPRO_CASE_LICENSE = GPL-3.0+
DESKPIPRO_CASE_DEPENDENCIES = lirc-tools

define DESKPIPRO_CASE_BUILD_CMDS
	#$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/installation/drivers/c/fanStop $(@D)/installation/drivers/c/fanStop.c
	$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/installation/drivers/c/pwmFanControl $(@D)/installation/drivers/c/pwmFanControl.c
	$(HOST_DIR)/bin/aarch64-linux-gcc -o $(@D)/installation/drivers/c/safeCutOffPower $(@D)/installation/drivers/c/safeCutOffPower.c
endef

define DESKPIPRO_CASE_INSTALL_TARGET_CMDS
	#$(INSTALL) -D -m 0755 $(@D)/installation/drivers/c/fanStop $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/installation/drivers/c/pwmFanControl $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/installation/drivers/c/safeCutOffPower $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
