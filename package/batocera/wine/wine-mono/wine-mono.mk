################################################################################
#
# wine-mono
#
################################################################################
# Version: Commits on Mar 17, 2025
WINE_MONO_VERSION = wine-mono-10.0.0
WINE_MONO_SOURCE = $(WINE_MONO_VERSION)-x86.tar.xz
WINE_MONO_SITE = https://github.com/wine-mono/wine-mono/releases/download/$(WINE_MONO_VERSION)

define WINE_MONO_EXTRACT_CMDS
	mkdir -p $(@D)/target/usr/wine/wine-custom/share/wine/mono/
	cd $(@D)/target/usr/wine/wine-custom/share/wine/mono/ && \
	    tar xf $(DL_DIR)/$(WINE_MONO_DL_SUBDIR)/$(WINE_MONO_SOURCE)
endef

define WINE_MONO_INSTALL_TARGET_CMDS
	cp -prn $(@D)/target/* $(TARGET_DIR)
endef

$(eval $(generic-package))
