################################################################################
#
# noto-cjk-fonts
#
################################################################################
# Version: Commits on Jan 27, 2022
NOTO_CJK_FONTS_VERSION = Sans2.004
NOTO_CJK_FONTS_SITE = https://github.com/notofonts/noto-cjk/releases/download/$(NOTO_CJK_FONTS_VERSION)
NOTO_CJK_FONTS_SOURCE = 02_NotoSansCJK-TTF-VF.zip
NOTO_CJK_FONTS_LICENSE = OFL-1.1

define NOTO_CJK_FONTS_EXTRACT_CMDS
	$(UNZIP) -q -o -d $(@D) $(NOTO_CJK_FONTS_DL_DIR)/$(NOTO_CJK_FONTS_SOURCE)
endef

define NOTO_CJK_FONTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/fonts/truetype/noto $(@D)/Variable/TTF/Subset/*.ttf
endef

$(eval $(generic-package))
