################################################################################
#
# ecwolf
#
################################################################################
# Version: Commits on Sept 14, 2025
ECWOLF_VERSION = 6ecb8325a2c13f96c9e9ff088ea5600ed3f624f7
ECWOLF_SITE = https://bitbucket.org/ecwolf/ecwolf.git
ECWOLF_SITE_METHOD=git
ECWOLF_GIT_SUBMODULES=YES
ECWOLF_LICENSE = Non-commercial
ECWOLF_DEPENDENCIES = host-ecwolf sdl2 sdl2_mixer sdl2_net zlib bzip2 jpeg
ECWOLF_SUPPORTS_IN_SOURCE_BUILD = YES

HOST_ECWOLF_CONF_OPTS += -DTOOLS_ONLY=ON

ECWOLF_CONF_OPTS += -DGPL=ON
ECWOLF_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
ECWOLF_CONF_OPTS += -DIMPORT_EXECUTABLES="$(HOST_ECWOLF_BUILDDIR)/ImportExecutables.cmake"

define ECWOLF_CROSS
	$(HOST_ECWOLF_BUILDDIR)/deps/gdtoa/arithchk > $(@D)/deps/gdtoa/arith.h
	$(HOST_ECWOLF_BUILDDIR)/deps/gdtoa/qnan > $(@D)/deps/gdtoa/gd_qnan.h
endef
ECWOLF_PRE_CONFIGURE_HOOKS += ECWOLF_CROSS

define ECWOLF_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/ecwolf
	$(INSTALL) -D -m 0755 $(@D)/ecwolf $(TARGET_DIR)/usr/share/ecwolf/ecwolf
	$(TARGET_STRIP) $(TARGET_DIR)/usr/share/ecwolf/ecwolf
	cp -a $(@D)/ecwolf.pk3 $(TARGET_DIR)/usr/share/ecwolf/
	ln -sf /usr/share/ecwolf/ecwolf $(TARGET_DIR)/usr/bin/ecwolf

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/ecwolf/ecwolf.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
