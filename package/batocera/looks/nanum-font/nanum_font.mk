################################################################################
#
# nanum_font
#
################################################################################
# Version: Commits on Feb 02, 2025
NANUM_FONT_VERSION = 2385eb085e4bf326590a2db6d4514e8477d9922f
NANUM_FONT_SITE = $(call github,bulzipke,nanum-font,$(NANUM_FONT_VERSION))

define NANUM_FONT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/ttf/NanumGothicBold.ttf $(TARGET_DIR)/usr/share/fonts/truetype/nanum/NanumGothicBold.ttf
endef

$(eval $(generic-package))
