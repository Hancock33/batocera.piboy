################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Jul 01, 2026
SONICNEXUS_VERSION = cc411106137dca8d3936c709d6a1875aa788fd9c
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_EMULATOR_INFO = sonicnexus.emulator.yml
SONICNEXUS_DEPENDENCIES = libogg libvorbis sdl2
SONICNEXUS_SUPPORTS_IN_SOURCE_BUILD = NO
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv2 $(TARGET_DIR)/usr/bin/sonicnexus
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
