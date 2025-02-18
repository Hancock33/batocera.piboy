################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Dec 02, 2024
SONICNEXUS_VERSION = d83967b2ea38eda8b43437167d93c86021bb4de1
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_DEPENDENCIES = libogg libvorbis sdl2
SONICNEXUS_SUPPORTS_IN_SOURCE_BUILD = NO
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/Nexus  $(TARGET_DIR)/usr/bin/sonicnexus
endef

$(eval $(cmake-package))
