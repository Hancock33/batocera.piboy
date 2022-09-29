################################################################################
#
# rpi-userland-batocera
#
################################################################################
# Version: Commits on Jun 15, 2022
RPI_USERLAND_BATOCERA_VERSION = 54fd97ae4066a10b6b02089bc769ceed328737e0
RPI_USERLAND_BATOCERA_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_BATOCERA_VERSION))

RPI_USERLAND_BATOCERA_LICENSE = BSD-3-Clause
RPI_USERLAND_BATOCERA_IN_SOURCE_BUILD = NO

RPI_USERLAND_BATOCERA_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
RPI_USERLAND_BATOCERA_CONF_OPTS += -DARM64=ON

define RPI_USERLAND_BATOCERA_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/build/bin/* $(TARGET_DIR)/usr/bin
	cp -pvr $(@D)/build/lib/*.so $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))
