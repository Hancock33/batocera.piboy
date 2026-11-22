################################################################################
#
# winbtrfs
#
################################################################################
# Version: Commits on Sept 01, 2026
WINBTRFS_VERSION = v1.10
WINBTRFS_SOURCE = btrfs-$(subst v,,$(WINBTRFS_VERSION)).zip
WINBTRFS_SITE = https://github.com/maharmstone/btrfs/releases/download/$(WINBTRFS_VERSION)
WINBTRFS_LICENSE = LGPL-3.0
WINBTRFS_INSTALL_IMAGES = YES

define WINBTRFS_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(WINBTRFS_DL_SUBDIR)/$(WINBTRFS_SOURCE) -d $(@D)
endef

define WINBTRFS_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/tools/btrfs_on_windows $(@D)/btrfs.cat $(@D)/btrfs.inf $(WINBTRFS_PKGDIR)/readme.txt
	cp -pr $(@D)/x86 $(@D)/amd64 $(BINARIES_DIR)/tools/btrfs_on_windows/
endef

$(eval $(generic-package))
