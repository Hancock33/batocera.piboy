################################################################################
#
# openmsx
#
################################################################################
# Version: Commits on Jul 15, 2025
OPENMSX_VERSION = 0fc60c19535ba27098eca47c0258074184b028e0
OPENMSX_SITE = $(call github,openMSX,openMSX,$(OPENMSX_VERSION))
OPENMSX_LICENSE = GPLv2
OPENMSX_DEPENDENCIES = freetype libogg libpng libtheora libvorbis sdl2 sdl2_ttf tcl zlib

OPENMSX_CONF_ENV += $(TARGET_CONFIGURE_OPTS) \
				OPENMSX_TARGET_CPU=$(BR2_ARCH) \
				OPENMSX_TARGET_OS="linux" \
				CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
				CC_FOR_BUILD="$(TARGET_CC)" GCC_FOR_BUILD="$(TARGET_CC)" \
				CXX_FOR_BUILD="$(TARGET_CXX)" \
				CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
				PREFIX="$(STAGING_DIR)" \
				SYSROOT="$(STAGING_DIR)" \
				PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
				PYTHON="$(HOST_DIR)/bin/python" \
				PATH="$(STAGING_DIR)/usr/bin:$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)" \
				TCL_CONFIG="$(STAGING_DIR)/usr/lib" LD_FOR_BUILD="$(TARGET_CROSS)ld"

# additional config options
#linux
ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
OPENMSX_CONF_OPTS += -Dalsamidi=enabled
OPENMSX_DEPENDENCIES += alsa-lib
else
OPENMSX_CONF_OPTS += -Dalsamidi=disabled
endif
#glrenderer
ifeq ($(BR2_PACKAGE_LIBGLEW)$(BR2_PACKAGE_LIBGLU),yy)
OPENMSX_CONF_OPTS += -Dglrenderer=enabled
OPENMSX_DEPENDENCIES += libglew libglu
else
OPENMSX_CONF_OPTS += -Dglrenderer=disabled
endif
#laserdisc
ifeq ($(BR2_PACKAGE_LIBOGG)$(BR2_PACKAGE_LIBTHEORA)$(BR2_PACKAGE_LIBVORBIS),yyy)
OPENMSX_CONF_OPTS += -Dlaserdisc=enabled
OPENMSX_DEPENDENCIES += libogg libtheora libvorbis
else
OPENMSX_CONF_OPTS += -Dlaserdisc=disabled
endif

#fix tclConfig.sh paths!
define OPENMSX_TCL_CONFIG_FIXUP
	rm -rf $(TARGET_DIR)/usr/share/openmsx
	cp $(STAGING_DIR)/usr/lib/tclConfig.sh $(STAGING_DIR)/usr/lib/tclConfig.sh.bak
	sed -i "s@TCL_LIB_SPEC='-L/usr/lib -ltcl8.6'@TCL_LIB_SPEC='-L$(STAGING_DIR)/usr/lib -ltcl8.6'@" $(STAGING_DIR)/usr/lib/tclConfig.sh
	sed -i "s@TCL_INCLUDE_SPEC='-I/usr/include'@TCL_INCLUDE_SPEC='-I$(STAGING_DIR)/usr/include'@" $(STAGING_DIR)/usr/lib/tclConfig.sh
endef

#change the appropriate directories & then compile & install.
define OPENMSX_BUILD_CMDS
	sed -i 's@SYMLINK_FOR_BINARY:=true@SYMLINK_FOR_BINARY:=false@' $(@D)/build/custom.mk
	sed -i 's@INSTALL_BASE:=/opt/openMSX@INSTALL_BASE:=$(TARGET_DIR)/usr/share/openmsx@' $(@D)/build/custom.mk
	echo 'INSTALL_DOC_DIR:=$(TARGET_DIR)/usr/share/doc/openmsx' >> $(@D)/build/custom.mk
	echo 'INSTALL_SHARE_DIR:=$(TARGET_DIR)/usr/share/openmsx' >> $(@D)/build/custom.mk
	echo 'INSTALL_BINARY_DIR:=$(TARGET_DIR)/usr/bin' >> $(@D)/build/custom.mk
	$(OPENMSX_CONF_ENV) $(MAKE) -C $(@D) install
endef

define OPENMSX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/openmsx/*.keys $(TARGET_DIR)/usr/share/evmapy/
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/openmsx/settings.xml $(TARGET_DIR)/usr/share/openmsx
endef

define OPENMSX_POST_INSTALL_CLEANUP
	if test -d $(STAGING_DIR)/usr/lib/tclConfig.sh.bak; then mv -f $(STAGING_DIR)/usr/lib/tclConfig.sh.bak $(STAGING_DIR)/usr/lib/tclConfig.sh; fi
endef

OPENMSX_PRE_CONFIGURE_HOOKS += OPENMSX_TCL_CONFIG_FIXUP

OPENMSX_POST_INSTALL_TARGET_HOOKS += OPENMSX_POST_INSTALL_CLEANUP

$(eval $(autotools-package))
