################################################################################
#
# libcapsimage
#
################################################################################
# Version: Commits on Sept 01, 2022
LIBCAPSIMAGE_VERSION = 502015b6e117e7c52fd143025856f9b5b242b6d6
LIBCAPSIMAGE_SITE = $(call github,simonowen,capsimage,$(LIBCAPSIMAGE_VERSION))

LIBCAPSIMAGE_INSTALL_STAGING = YES

define LIBCAPSIMAGE_FSUAE
	# FS-UAE specific install
	mkdir -p $(TARGET_DIR)/usr/share/fs-uae/Plugins
	ln -sf /usr/lib/libcapsimage.so.5.1 $(TARGET_DIR)/usr/share/fs-uae/Plugins/capsimg.so
		echo 5.1 > $(TARGET_DIR)/usr/share/fs-uae/Plugins/Version.txt
endef

LIBCAPSIMAGE_POST_INSTALL_TARGET_HOOKS += LIBCAPSIMAGE_FSUAE

$(eval $(cmake-package))
