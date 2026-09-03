################################################################################
#
# linuxloader
#
################################################################################
# Version: Commits on Sept 01, 2026
LINUXLOADER_VERSION = f7ca86fdef265c90dc793c5724a098545631b6e3
LINUXLOADER_SITE = $(call github,lindbergh-loader,linuxloader,$(LINUXLOADER_VERSION))
LINUXLOADER_LICENSE = CC-BY-SA-4.0
LINUXLOADER_LICENSE_FILES = LICENSE.md
LINUXLOADER_EMULATOR_INFO = linuxloader.emulator.yml

ifeq ($(BR2_x86_64),y)
LINUXLOADER_DEPENDENCIES += wine-x86 dmidecode ossp
define LINUXLOADER_CROSSHAIRS
	mkdir -p $(TARGET_DIR)/usr/bin32/linuxloader/crosshairs
	cp -fv $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/linuxloader/crosshairs/* $(TARGET_DIR)/usr/bin32/linuxloader/crosshairs/
endef

LINUXLOADER_POST_INSTALL_TARGET_HOOKS += LINUXLOADER_CROSSHAIRS

$(eval $(generic-package))
endif

ifeq ($(BR2_i386),y)
LINUXLOADER_DEPENDENCIES += alsa-lib alsa-plugins alsa-utils faudio libfreeglut pcsc-lite
LINUXLOADER_DEPENDENCIES += libglew sdl3 sdl3_image sdl3_ttf ncurses openal pipewire xlib_libX11 libbsd
LINUXLOADER_DEPENDENCIES += xlib_libXcursor xlib_libXext xlib_libXi xlib_libXmu xlib_libXScrnSaver
LINUXLOADER_IN_SOURCE_BUILD = NO

LINUXLOADER_CONF_OPTS += -DCMAKE_C_FLAGS=-std=gnu17

define LINUXLOADER_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/bin/linuxloader/extralibs

    # Main binaries & libraries built by CMake
    cp -fv $(LINUXLOADER_BUILDDIR)/linuxloader $(TARGET_DIR)/usr/bin/linuxloader/
    cp -fv $(LINUXLOADER_BUILDDIR)/linuxloader.so $(TARGET_DIR)/usr/bin/linuxloader/
    cp -fav $(LINUXLOADER_BUILDDIR)/lib*.so* $(TARGET_DIR)/usr/bin/linuxloader/extralibs/

    # Extract and copy repo bundled libraries
    if [ -f $(@D)/libs/linux_x86/Cg-3.1.zip ]; then \
        unzip -o $(@D)/libs/linux_x86/Cg-3.1.zip -d $(TARGET_DIR)/usr/bin/linuxloader/extralibs/; \
    fi
    cp -fv $(@D)/libs/linux_x86/libCg.so $(TARGET_DIR)/usr/bin/linuxloader/extralibs/libCg2.so
    cp -fv $(@D)/libs/linux_x86/libopenal.so.0 $(TARGET_DIR)/usr/bin/linuxloader/extralibs/
    cp -fv $(@D)/libs/linux_x86/libcrypto.so.0.9.7 $(TARGET_DIR)/usr/bin/linuxloader/extralibs/
    cp -fv $(@D)/libs/linux_x86/libssl.so.0.9.7 $(TARGET_DIR)/usr/bin/linuxloader/extralibs/

    # Critical NVIDIA / Posix symlinks
    ln -sf libposixtime.so $(TARGET_DIR)/usr/bin/linuxloader/extralibs/libposixtime.so.1
    ln -sf libposixtime.so $(TARGET_DIR)/usr/bin/linuxloader/extralibs/libposixtime.so.2.4
    ln -sf libkswapapi.so $(TARGET_DIR)/usr/bin/linuxloader/extralibs/libGLcore.so.1
    ln -sf libkswapapi.so $(TARGET_DIR)/usr/bin/linuxloader/extralibs/libnvidia-tls.so.1

    # Batocera package overrides / configs
    cp -fv $(LINUXLOADER_PKGDIR)/*.ini $(TARGET_DIR)/usr/bin/linuxloader/
    cp -fav $(LINUXLOADER_PKGDIR)/lib*.so* $(TARGET_DIR)/usr/bin/linuxloader/extralibs/
endef

$(eval $(cmake-package))
endif

$(eval $(emulator-info-package))
