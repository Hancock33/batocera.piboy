################################################################################
#
# deskpipro-case
#
################################################################################
# Version: Commits on Jun 15, 2026
DESKPIPRO_CASE_VERSION = 6d291f77f78badf0361daeb4134086768c73d1cb
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
