################################################################################
#
# wine-mono
#
################################################################################
# Version: Commits on Aug 16, 2024
WINE_MONO_VERSION = wine-mono-9.3.0
WINE_MONO_SOURCE = wine-mono-$(WINE_MONO_VERSION)-x86.tar.xz
WINE_MONO_SITE = https://github.com/madewokherd/wine-mono/releases/download/wine-mono-$(WINE_MONO_VERSION)

define WINE_MONO_EXTRACT_CMDS
	mkdir -p $(@D)/target/usr/wine/ge-custom/share/wine/mono/
	cd $(@D)/target/usr/wine/ge-custom/share/wine/mono/ && \
	    tar xf $(DL_DIR)/$(WINE_MONO_DL_SUBDIR)/$(WINE_MONO_SOURCE)
endef

define WINE_MONO_INSTALL_TARGET_CMDS
	cp -prn $(@D)/target/* $(TARGET_DIR)
endef

$(eval $(generic-package))
