################################################################################
#
# chromebook-ucm-conf
#
################################################################################
# Version: Commits on Nov 25, 2024
CHROMEBOOK_UCM_CONF_VERSION = 0.7
CHROMEBOOK_UCM_CONF_BRANCH = standalone
CHROMEBOOK_UCM_CONF_SITE = $(call github,WeirdTreeThing,alsa-ucm-conf-cros,$(CHROMEBOOK_UCM_CONF_VERSION))
CHROMEBOOK_UCM_CONF_LICENSE = BSD-3-Clause
CHROMEBOOK_UCM_CONF_LICENSE_FILES = LICENSE

# we need the alsa-ucm dependencies first
CHROMEBOOK_UCM_CONF_DEPENDENCIES += alllinuxfirmwares alsa-ucm-conf alsa-utils sound-open-firmware

define CHROMEBOOK_UCM_CONF_INSTALL_TARGET_CMDS
	rsync -arv $(@D)/ucm2/* $(TARGET_DIR)/usr/share/alsa/ucm2/
endef

$(eval $(generic-package))
