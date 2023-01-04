################################################################################
#
# wine-x86
#
################################################################################
WINE_X86_VERSION = 20230104
WINE_X86_SOURCE = batocera-x86-32bit-libs-$(WINE_X86_VERSION).tar.xz
WINE_X86_SITE = https://github.com/Hancock33/batocera-rp4-32bit-libs/releases/download/$(WINE_X86_VERSION)

define WINE_X86_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && tar xf $(DL_DIR)/$(WINE_X86_DL_SUBDIR)/$(WINE_X86_SOURCE)
endef

define WINE_X86_INSTALL_TARGET_CMDS
	cp -prn $(@D)/target/* $(TARGET_DIR)
endef

$(eval $(generic-package))
