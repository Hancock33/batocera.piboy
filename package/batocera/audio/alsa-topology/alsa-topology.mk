################################################################################
#
# alsa-topology
#
################################################################################
# Version: Commits on Mar 11, 2021
ALSA_TOPOLOGY_VERSION = v1.2.5.1
ALSA_TOPOLOGY_SITE = $(call github,alsa-project,alsa-topology-conf,$(ALSA_TOPOLOGY_VERSION))
ALSA_TOPOLOGY_LICENSE = BSD-3-Clause
ALSA_TOPOLOGY_LICENSE_FILES = LICENSE

define ALSA_TOPOLOGY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/alsa
	rsync -a $(@D)/topology/* $(TARGET_DIR)/usr/share/alsa/topology/
endef

$(eval $(generic-package))
