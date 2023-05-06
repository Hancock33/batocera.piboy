################################################################################
#
# alsa-ucm-conf
#
################################################################################
# Version.: Commits on May 4, 2023
ALSA_UCM_CONF_VERSION = 906f692e4ed84dc136c270c05e1b490a554de99b
ALSA_UCM_CONF_SITE = $(call github,alsa-project,alsa-ucm-conf,$(ALSA_UCM_CONF_VERSION))
ALSA_UCM_CONF_LICENSE = BSD-3-Clause
ALSA_UCM_CONF_LICENSE_FILES = LICENSE

define ALSA_UCM_CONF_INSTALL_TARGET_CMDS
	rsync -arv $(@D)/ucm* $(TARGET_DIR)/usr/share/alsa/
endef

$(eval $(generic-package))
