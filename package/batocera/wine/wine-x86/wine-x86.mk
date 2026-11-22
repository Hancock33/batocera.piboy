################################################################################
#
# wine-x86
#
################################################################################
# Version: Commits on Nov 21, 2026
WINE_X86_VERSION = 20261121
WINE_X86_SOURCE = batocera-x86-32bit-libs-$(WINE_X86_VERSION).tar.xz
WINE_X86_SITE = https://github.com/Hancock33/batocera-32bit-libs/releases/download/$(WINE_X86_VERSION)

define WINE_X86_INSTALL_TARGET_CMDS
	$(TAR) xf $(WINE_X86_DL_DIR)/$(WINE_X86_SOURCE) -C $(TARGET_DIR)
	find $(TARGET_DIR)/usr/wine -type f -name "*.a" -delete
endef

$(eval $(generic-package))
