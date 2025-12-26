################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Dec 25, 2025
SONICNEXUS_VERSION = fd4c240da0753caa5a0362e1d8f64ee33ab20fa9
SONICNEXUS_SITE = $(call github,RSDKModding,RSDKv2-Decompilation,$(SONICNEXUS_VERSION))
SONICNEXUS_DEPENDENCIES = libogg libvorbis sdl2
SONICNEXUS_SUPPORTS_IN_SOURCE_BUILD = NO
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv2 $(TARGET_DIR)/usr/bin/sonicnexus
endef

$(eval $(cmake-package))
