################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Dec 18, 2025
SONICNEXUS_VERSION = e1eff0cc5b5aa2902a084a6c24d43a4be3296873
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_DEPENDENCIES = libogg libvorbis sdl2
SONICNEXUS_SUPPORTS_IN_SOURCE_BUILD = NO
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv2 $(TARGET_DIR)/usr/bin/sonicnexus
endef

$(eval $(cmake-package))
