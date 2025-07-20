################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Jul 17, 2025
SONICNEXUS_VERSION = 35844a263d06655b806f18158a85abca75c99005
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_DEPENDENCIES = libogg libvorbis sdl2
SONICNEXUS_SUPPORTS_IN_SOURCE_BUILD = NO
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/Nexus  $(TARGET_DIR)/usr/bin/sonicnexus
endef

$(eval $(cmake-package))
