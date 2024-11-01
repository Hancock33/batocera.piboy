################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Nov 01, 2024
SONICNEXUS_VERSION = 17540a395182aeca0570f489daf83fa4899da91d
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_DEPENDENCIES = sdl2 libogg libvorbis
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -flto" CXXFLAGS="$(TARGET_CXXFLAGS) -flto" \
	$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile USE_HW_REN=1
endef

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/nexus  $(TARGET_DIR)/usr/bin/sonicnexus
endef

define SONICNEXUS_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/sonicnexus/sonicnexus.keys $(TARGET_DIR)/usr/share/evmapy
endef

SONICNEXUS_POST_INSTALL_TARGET_HOOKS += SONICNEXUS_EVMAPY

$(eval $(generic-package))
