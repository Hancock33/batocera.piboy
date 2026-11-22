################################################################################
#
# pacman
#
################################################################################
# Version: Commits on Jun 26, 2020
PACMAN_VERSION = v5.2.2
PACMAN_SITE = https://gitlab.archlinux.org/pacman/pacman.git
PACMAN_SITE_METHOD = git
PACMAN_LICENSE = GPL-2.0
PACMAN_DEPENDENCIES = glibc libarchive libcurl libgpgme openssl gnupg

ifeq ($(BR2_x86_64),y)
PACMAN_ARCH = x86_64
else ifeq ($(BR2_x86_i686),y)
PACMAN_ARCH = x86
else ifeq ($(BR2_x86_haswell),y)
PACMAN_ARCH = x86
else ifeq ($(BR2_x86_prescott),y)
PACMAN_ARCH = x86
else ifeq ($(BR2_aarch64),y)
PACMAN_ARCH = aarch64
else ifeq ($(BR2_arm),y)
PACMAN_ARCH = armv7l
else ifeq ($(BR2_riscv),y)
PACMAN_ARCH = riscv
else
$(error This architecture won't be supported with pacman on Batocera)
endif

define BATOCERA_PACMAN_INSTALL_CONF
	rm -f $(TARGET_DIR)/usr/bin/makepkg
	$(INSTALL) -D -m 0644 $(PACMAN_PKGDIR)/pacman.conf $(TARGET_DIR)/etc/pacman.conf
	$(INSTALL) -D -m 0755 $(PACMAN_PKGDIR)/batocera-makepkg $(TARGET_DIR)/usr/bin/batocera-makepkg
	$(INSTALL) -D -m 0755 $(PACMAN_PKGDIR)/batocera-pacman-batoexec $(TARGET_DIR)/usr/bin/batocera-pacman-batoexec
	$(INSTALL) -D -m 0755 $(PACMAN_PKGDIR)/batocera-install.hook $(TARGET_DIR)/etc/pacman/hooks/batocera-install.hook
	$(INSTALL) -D -m 0755 $(PACMAN_PKGDIR)/batocera-uninstall.hook $(TARGET_DIR)/etc/pacman/hooks/batocera-uninstall.hook
	$(INSTALL) -D -m 0644 $(PACMAN_PKGDIR)/userdata_pacman.conf $(TARGET_DIR)/usr/share/batocera/datainit/system/pacman/pacman.conf
	$(SED) 's+{BATOCERA_ARCHITECTURE}+$(PACMAN_ARCH)+' $(TARGET_DIR)/etc/pacman.conf
	$(SED) 's+/usr/bin/bash+/bin/bash+' $(TARGET_DIR)/usr/bin/repo-add
endef

PACMAN_POST_INSTALL_TARGET_HOOKS = BATOCERA_PACMAN_INSTALL_CONF

$(eval $(meson-package))
