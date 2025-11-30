################################################################################
#
# wine-mono
#
################################################################################
# Version: Commits on Nov 29, 2025
WINE_MONO_VERSION = wine-mono-10.4.0
WINE_MONO_SOURCE = $(WINE_MONO_VERSION)-x86.tar.xz
WINE_MONO_SITE = https://github.com/wine-mono/wine-mono/releases/download/$(WINE_MONO_VERSION)

define WINE_MONO_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/wine/wine-mono-*
	mkdir -p $(TARGET_DIR)/usr/share/wine/$(WINE_MONO_VERSION)
	rsync -a --exclude='.*' $(@D)/ $(TARGET_DIR)/usr/share/wine/$(WINE_MONO_VERSION)
endef

$(eval $(generic-package))
