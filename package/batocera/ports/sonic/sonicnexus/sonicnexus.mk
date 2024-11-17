################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Nov 14, 2024
SONICNEXUS_VERSION = a2e0b5d5fe76dc16890548fddd8c6fba3822add7
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_DEPENDENCIES = sdl2 libogg libvorbis
SONICNEXUS_LICENSE = Custom
SONICNEXUS_SUPPORTS_IN_SOURCE_BUILD = NO

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/Nexus  $(TARGET_DIR)/usr/bin/sonicnexus
endef

define SONICNEXUS_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/sonicnexus/sonicnexus.keys $(TARGET_DIR)/usr/share/evmapy
endef

SONICNEXUS_POST_INSTALL_TARGET_HOOKS += SONICNEXUS_EVMAPY

$(eval $(cmake-package))

