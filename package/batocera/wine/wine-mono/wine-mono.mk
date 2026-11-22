################################################################################
#
# wine-mono
#
################################################################################
# Version: Commits on Aug 13, 2026
WINE_MONO_VERSION = wine-mono-11.3.0
WINE_MONO_SOURCE = $(WINE_MONO_VERSION)-x86.tar.xz
WINE_MONO_SITE = https://github.com/wine-mono/wine-mono/releases/download/$(WINE_MONO_VERSION)
WINE_MONO_LICENSE = GPL-2.0, LGPL-2.1, MIT

define WINE_MONO_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/wine/wine-mono-*
	mkdir -p $(TARGET_DIR)/usr/share/wine/$(WINE_MONO_VERSION)
	rsync -a --exclude='.*' $(@D)/ $(TARGET_DIR)/usr/share/wine/$(WINE_MONO_VERSION)
endef

$(eval $(generic-package))
