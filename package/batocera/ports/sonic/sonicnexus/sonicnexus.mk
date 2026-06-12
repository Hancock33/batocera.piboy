################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Jun 12, 2026
SONICNEXUS_VERSION = 5bd5627ca36c74691803d9327c89e3985afeef90
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
