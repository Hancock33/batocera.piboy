################################################################################
#
# wine-x86
#
################################################################################
# Version: Commits on Oct 28, 2025
WINE_X86_VERSION = 20251028
WINE_X86_SOURCE = batocera-x86-32bit-libs-$(WINE_X86_VERSION).tar.xz
WINE_X86_SITE = https://github.com/Hancock33/batocera-32bit-libs/releases/download/$(WINE_X86_VERSION)

define WINE_X86_EXTRACT_CMDS
	tar xf $(DL_DIR)/$(WINE_X86_DL_SUBDIR)/$(WINE_X86_SOURCE) -C $(TARGET_DIR)
endef

define WINE_X86_INSTALL_TARGET_CMDS
	find $(TARGET_DIR)/usr/wine -type f -name "*.a" -exec rm {} \;
endef

$(eval $(generic-package))
