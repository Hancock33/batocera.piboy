################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Jan 26, 2025
SONICNEXUS_VERSION = fa913619ac7a3ec1d5d3f67a1e663a56ebef9691
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_DEPENDENCIES = libogg libvorbis sdl2
SONICNEXUS_SUPPORTS_IN_SOURCE_BUILD = NO
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/Nexus  $(TARGET_DIR)/usr/bin/sonicnexus
endef

$(eval $(cmake-package))
