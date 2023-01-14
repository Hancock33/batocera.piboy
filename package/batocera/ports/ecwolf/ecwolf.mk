################################################################################
#
# ecwolf
#
################################################################################
# Version: Commits on Jan 13, 2023
ECWOLF_VERSION = a376734f5793fca1ef4c79e1b9d0d82e525f36ca
ECWOLF_SITE = https://bitbucket.org/ecwolf/ecwolf.git
ECWOLF_SITE_METHOD=git
ECWOLF_GIT_SUBMODULES=YES
ECWOLF_LICENSE = Non-commercial
ECWOLF_DEPENDENCIES = host-ecwolf sdl2 sdl2_mixer sdl2_net zlib bzip2 jpeg
ECWOLF_SUPPORTS_IN_SOURCE_BUILD = NO

HOST_ECWOLF_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DTOOLS_ONLY=ON

ECWOLF_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DNO_GTK=ON -DFORCE_CROSSCOMPILE=ON \
                    -DINTERNAL_SDL{,_MIXER,_MIXER_CODECS,_NET}=ON \
                    -DIMPORT_EXECUTABLES="$(HOST_ECWOLF_BUILDDIR)/ImportExecutables.cmake"

define ECWOLF_CROSS
    $(HOST_ECWOLF_BUILDDIR)/deps/gdtoa/arithchk > $(@D)/deps/gdtoa/arith.h
    $(HOST_ECWOLF_BUILDDIR)/deps/gdtoa/qnan > $(@D)/deps/gdtoa/gd_qnan.h
endef
ECWOLF_POST_EXTRACT_HOOKS += ECWOLF_CROSS

define ECWOLF_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/ecwolf
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/ecwolf $(TARGET_DIR)/usr/share/ecwolf/ecwolf
	$(TARGET_STRIP) $(TARGET_DIR)/usr/share/ecwolf/ecwolf
	cp -a $(@D)/buildroot-build/ecwolf.pk3 $(TARGET_DIR)/usr/share/ecwolf/
	ln -sf /usr/share/ecwolf/ecwolf $(TARGET_DIR)/usr/bin/ecwolf

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/ecwolf/ecwolf.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
