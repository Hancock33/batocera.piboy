################################################################################
#
# sugarbox
#
################################################################################
# Version: Commits on Nov 24, 2024
SUGARBOX_VERSION = 9b927f280322b6bb13998e06b83710201960181b
SUGARBOX_SITE = https://github.com/Tom1975/SugarboxV2.git
SUGARBOX_SITE_METHOD=git
SUGARBOX_GIT_SUBMODULES=YES
SUGARBOX_LICENSE = MIT
SUGARBOX_DEPENDENCIES = qt6base qt6tools qt6websockets

ifeq ($(BR2_PACKAGE_WAYLAND),y)
SUGARBOX_DEPENDENCIES += qt6wayland
endif

SUGARBOX_SUPPORTS_IN_SOURCE_BUILD = NO

SUGARBOX_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
SUGARBOX_CONF_OPTS += -DALSOFT_UPDATE_BUILD_VERSION=OFF
SUGARBOX_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr/bin/sugarbox/"

SUGARBOX_CONF_ENV += LDFLAGS=-lpthread

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588)$(BR2_PACKAGE_BATOCERA_TARGET_RK3588_SDIO),y)
  SUGARBOX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-lmali_hook -Wl,--whole-archive -lmali_hook_injector -Wl,--no-whole-archive -lmali"
endif

define SUGARBOX_QT6_FIX_CMAKE
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/sugarbox/CMakeLists.txt $(@D)/Sugarbox/CMakeLists.txt
endef

SUGARBOX_PRE_CONFIGURE_HOOKS += SUGARBOX_QT6_FIX_CMAKE

$(eval $(cmake-package))
