################################################################################
#
# uboot-visionfive2
#
################################################################################
# Version: Commits on Sept 27, 2024
UBOOT_VISIONFIVE2_VERSION = 3.6.1
UBOOT_VISIONFIVE2_SITE = https://github.com/starfive-tech/VisionFive2/releases/download/VF2_v$(UBOOT_VISIONFIVE2_VERSION)
UBOOT_VISIONFIVE2_SOURCE = u-boot-spl.bin.normal.out
UBOOT_VISIONFIVE2_LICENSE = GPL-2.0+
UBOOT_VISIONFIVE2_EXTRA_DOWNLOADS = visionfive2_fw_payload.img
UBOOT_VISIONFIVE2_INSTALL_IMAGES = YES

define UBOOT_VISIONFIVE2_EXTRACT_CMDS
endef

define UBOOT_VISIONFIVE2_BUILD_CMDS
endef

define UBOOT_VISIONFIVE2_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/uboot-visionfive2 $(UBOOT_VISIONFIVE2_DL_DIR)/u-boot-spl.bin.normal.out $(UBOOT_VISIONFIVE2_DL_DIR)/visionfive2_fw_payload.img
endef

$(eval $(generic-package))
