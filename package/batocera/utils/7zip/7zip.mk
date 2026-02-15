################################################################################
#
# 7zip
#
################################################################################
# Version: Commits on Feb 12, 2026
7ZIP_VERSION = 2600
7ZIP_SOURCE = 7z$(7ZIP_VERSION)-src.tar.xz
7ZIP_SITE = https://www.7-zip.org/a
7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
7ZIP_LICENSE_FILES = DOC/License.txt
7ZIP_CPE_ID_VENDOR = 7-zip

7ZIP_P7A_TARGET = $(@D)/CPP/7zip/Bundles/Alone
7ZIP_P7A_FILE = 7za
7ZIP_P7R_TARGET = $(@D)/CPP/7zip/Bundles/Alone7z
7ZIP_P7R_FILE = 7zr

define 7ZIP_BUILD_CMDS
	rm -r $(@D)/*
	cd  $(@D) && tar -xf $(7ZIP_DL_DIR)/$($(PKG)_SOURCE)
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/CPP/7zip/7zip_gcc.mak
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(7ZIP_P7A_TARGET) -f makefile.gcc
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(7ZIP_P7R_TARGET) -f makefile.gcc
endef

define 7ZIP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(7ZIP_P7A_TARGET)/_o/$(7ZIP_P7A_FILE) $(TARGET_DIR)/usr/bin/$(7ZIP_P7A_FILE)
	$(INSTALL) -D -m 0755 $(7ZIP_P7R_TARGET)/_o/$(7ZIP_P7R_FILE) $(TARGET_DIR)/usr/bin/$(7ZIP_P7R_FILE)
endef

define HOST_7ZIP_BUILD_CMDS
	rm -r $(@D)/*
	cd  $(@D) && tar -xf $(7ZIP_DL_DIR)/$($(PKG)_SOURCE)
	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(7ZIP_P7A_TARGET) -f makefile.gcc
	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(7ZIP_P7R_TARGET) -f makefile.gcc
endef

define HOST_7ZIP_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(7ZIP_P7A_TARGET)/_o/$(7ZIP_P7A_FILE) $(HOST_DIR)/bin/$(7ZIP_P7A_FILE)
	$(INSTALL) -D -m 0755 $(7ZIP_P7R_TARGET)/_o/$(7ZIP_P7R_FILE) $(HOST_DIR)/bin/$(7ZIP_P7R_FILE)
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
