################################################################################
#
# ecwolf
#
################################################################################
# Version.: Commits on Sep 24, 2022
ECWOLF_VERSION = db154c482943e89c16b8d4de23120e66f5312042
ECWOLF_SITE = https://bitbucket.org/ecwolf/ecwolf.git
ECWOLF_LICENSE = Non-commercial
ECWOLF_DEPENDENCIES = sdl2 host-ecwolf
ECWOLF_SITE_METHOD=git
ECWOLF_GIT_SUBMODULES=YES
ECWOLF_SUPPORTS_IN_SOURCE_BUILD = NO

HOST_ECWOLF_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DNO_GTK=ON -DINTERNAL_SDL=ON \
                    -DINTERNAL_SDL_MIXER=ON -DINTERNAL_SDL_NET=ON
					
ECWOLF_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DNO_GTK=ON -DFORCE_CROSSCOMPILE=ON -DINTERNAL_SDL=ON \
                    -DINTERNAL_SDL_MIXER=ON -DINTERNAL_SDL_NET=ON \
                    -DIMPORT_EXECUTABLES=$(BUILD_DIR)/host-ecwolf-$(ECWOLF_VERSION)/ImportExecutables.cmake

ECWOLF_CONF_ENV += LDFLAGS="-lpthread -lvorbisfile -lopusfile -lFLAC -lmodplug -lfluidsynth"

define ECWOLF_CROSS
 gcc -o $(@D)/deps/gdtoa/arithchk $(@D)/deps/gdtoa/arithchk.c -Wall -Wextra
             $(@D)/deps/gdtoa/arithchk > $(@D)/deps/gdtoa/arith.h

 gcc -o $(@D)/deps/gdtoa/qnan $(@D)/deps/gdtoa/qnan.c -Wall -Wextra
             $(@D)/deps/gdtoa/qnan > $(@D)/deps/gdtoa/gd_qnan.h
endef

ECWOLF_POST_EXTRACT_HOOKS += ECWOLF_CROSS

define ECWOLF_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/ecwolf
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/ecwolf $(TARGET_DIR)/usr/share/ecwolf/ecwolf
	cp -a $(@D)/buildroot-build/ecwolf.pk3 $(TARGET_DIR)/usr/share/ecwolf/
	ln -sf /usr/share/ecwolf/ecwolf $(TARGET_DIR)/usr/bin/ecwolf

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/ecwolf/ecwolf.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
