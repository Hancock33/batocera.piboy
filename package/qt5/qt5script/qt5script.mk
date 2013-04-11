#############################################################
#
# qt5script
#
#############################################################

QT5SCRIPT_VERSION = $(QT5_VERSION)
QT5SCRIPT_SITE = http://releases.qt-project.org/qt5/$(QT5SCRIPT_VERSION)/submodules_tar/
QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
QT5SCRIPT_DEPENDENCIES = qt5base
QT5SCRIPT_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT5SCRIPT_CONFIGURE_OPTS += -opensource -confirm-license
QT5SCRIPT_LICENSE = LGPLv2.1 or GPLv3.0
# Here we would like to get license files from qt5base, but qt5base
# may not be extracted at the time we get the legal-info for
# qt5script.
else
QT5SCRIPT_LICENSE = Commercial license
QT5SCRIPT_REDISTRIBUTE = NO
endif

define QT5SCRIPT_CONFIGURE_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
endef

define QT5SCRIPT_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5SCRIPT_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
	$(QT5_LA_PRL_FILES_FIXUP)
endef

ifeq ($(BR2_PREFER_STATIC_LIB),)
define QT5SCRIPT_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Script*.so.* $(TARGET_DIR)/usr/lib
endef
endif

$(eval $(generic-package))
