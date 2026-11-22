################################################################################
#
# sinden-guns
#
################################################################################
# Version: Commits on Mar 20, 2024
SINDEN_GUNS_VERSION = 1.09
SINDEN_GUNS_SOURCE = SindenLightgunSoftwareReleaseV$(SINDEN_GUNS_VERSION).zip
SINDEN_GUNS_SITE = https://www.sindenlightgun.com/software
SINDEN_GUNS_LICENSE = PROPRIETARY

SINDEN_GUNS_DEPENDENCIES = mono-bin sinden-guns-libs

# always take the x86 binary, while this is the only one working, bundles required for others
SINDEN_GUNS_ARCHIVE_DIR_PLAYER1 = SindenLightgunSoftwareReleaseV$(SINDEN_GUNS_VERSION)/SindenLightgunLinuxSoftwareV$(SINDEN_GUNS_VERSION)/X86/64bit/Lightgun/Player1

define SINDEN_GUNS_EXTRACT_CMDS
	$(UNZIP) -o $(SINDEN_GUNS_DL_DIR)/$(SINDEN_GUNS_SOURCE) -d $(@D)
endef

define SINDEN_GUNS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(SINDEN_GUNS_PKGDIR)/99-sinden.rules $(TARGET_DIR)/etc/udev/rules.d/99-sinden.rules
	$(INSTALL) -m 0644 -D $(SINDEN_GUNS_PKGDIR)/uvcvideo.conf $(TARGET_DIR)/etc/modprobe.d/uvcvideo.conf
	$(INSTALL) -m 0755 -D $(SINDEN_GUNS_PKGDIR)/virtual-sindenlightgun-add $(TARGET_DIR)/usr/bin/virtual-sindenlightgun-add
	$(INSTALL) -m 0755 -D $(SINDEN_GUNS_PKGDIR)/virtual-sindenlightgun-remap $(TARGET_DIR)/usr/bin/virtual-sindenlightgun-remap

	$(INSTALL) -m 0644 -D $(SINDEN_GUNS_PKGDIR)/LightgunMono.exe.config.template $(TARGET_DIR)/usr/share/sinden/LightgunMono.exe.config

	$(INSTALL) -m 0644 -D $(@D)/$(SINDEN_GUNS_ARCHIVE_DIR_PLAYER1)/LightgunMono.exe $(TARGET_DIR)/usr/share/sinden/LightgunMono.exe
	$(INSTALL) -m 0644 -D $(@D)/$(SINDEN_GUNS_ARCHIVE_DIR_PLAYER1)/AForge.Math.dll $(TARGET_DIR)/usr/share/sinden/AForge.Math.dll
	$(INSTALL) -m 0644 -D $(@D)/$(SINDEN_GUNS_ARCHIVE_DIR_PLAYER1)/AForge.dll $(TARGET_DIR)/usr/share/sinden/AForge.dll
	$(INSTALL) -m 0644 -D $(@D)/$(SINDEN_GUNS_ARCHIVE_DIR_PLAYER1)/AForge.Imaging.dll $(TARGET_DIR)/usr/share/sinden/AForge.Imaging.dll
	#$(INSTALL) -m 0644 -D $(@D)/$(SINDEN_GUNS_ARCHIVE_DIR_PLAYER1)/libSdlInterface.so	$(TARGET_DIR)/usr/share/sinden/libSdlInterface.so
	#$(INSTALL) -m 0644 -D $(@D)/$(SINDEN_GUNS_ARCHIVE_DIR_PLAYER1)/libCameraInterface.so $(TARGET_DIR)/usr/share/sinden/libCameraInterface.so
	$(INSTALL) -m 0644 -D $(@D)/$(SINDEN_GUNS_ARCHIVE_DIR_PLAYER1)/License.txt $(TARGET_DIR)/usr/share/sinden/License.txt
endef

$(eval $(generic-package))
