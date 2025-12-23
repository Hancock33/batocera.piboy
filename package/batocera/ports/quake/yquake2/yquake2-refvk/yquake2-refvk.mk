################################################################################
#
# yquake2-refvk
#
################################################################################
# Version: Commits on Dec 15, 2025
YQUAKE2_REFVK_VERSION = 21a1f386c44c5942510884e249aca46df149be22
YQUAKE2_REFVK_SITE = $(call github,yquake2,ref_vk,$(YQUAKE2_REFVK_VERSION))
YQUAKE2_REFVK_LICENSE = GPLv2
YQUAKE2_REFVK_LICENSE_FILES = LICENSE
YQUAKE2_REFVK_DEPENDENCIES += yquake2

define YQUAKE2_REFVK_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(YQUAKE2_REFVK_BUILD_ARGS) $(YQUAKE2_BUILD_ARCH) -C $(@D)
endef

define YQUAKE2_REFVK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/yquake2
	$(INSTALL) -D -m 0644 $(@D)/release/ref_vk.so $(TARGET_DIR)/usr/bin/yquake2
endef

$(eval $(generic-package))
