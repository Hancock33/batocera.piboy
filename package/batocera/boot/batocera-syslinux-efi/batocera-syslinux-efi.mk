################################################################################
#
# batocera-syslinux-efi
#
################################################################################
# Version: Commits on Nov 29, 2023
BATOCERA_SYSLINUX_EFI_VERSION = 6.04.pre2.r11.gbf6db5b4-2
BATOCERA_SYSLINUX_EFI_SOURCE =
BATOCERA_SYSLINUX_EFI_SITE = binaries
BATOCERA_SYSLINUX_EFI_LICENSE = GPL-2.0+
BATOCERA_SYSLINUX_EFI_DEPENDENCIES = host-dosfstools host-mtools
BATOCERA_SYSLINUX_EFI_INSTALL_IMAGES = YES

define BATOCERA_SYSLINUX_EFI_EXTRACT_CMDS
	cp -R $(BATOCERA_SYSLINUX_EFI_PKGDIR)/binaries/* $(@D)
endef

define BATOCERA_SYSLINUX_EFI_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 $(@D)/bootx64.selfsigned.efi $(BINARIES_DIR)/syslinux/bootx64.efi
	$(INSTALL) -D -m 0644 $(@D)/fbx64.selfsigned.efi $(BINARIES_DIR)/syslinux/fbx64.efi
	$(INSTALL) -D -m 0644 $(@D)/grubia32.selfsigned.efi $(BINARIES_DIR)/syslinux/grubia32.efi
	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/syslinux $(@D)/batocera-mok.cer $(@D)/ldlinux.e64 $(@D)/ldlinux.e32
	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/syslinux/efi64 $(@D)/menu.c32 $(@D)/libutil.c32
endef

$(eval $(generic-package))
