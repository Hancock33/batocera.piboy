################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Apr 14, 2025
SONICNEXUS_VERSION = 90672d8a49b242357d0ba50ee7110776d3182b45
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_DEPENDENCIES = libogg libvorbis sdl2
SONICNEXUS_SUPPORTS_IN_SOURCE_BUILD = NO
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/Nexus  $(TARGET_DIR)/usr/bin/sonicnexus
endef

$(eval $(cmake-package))
