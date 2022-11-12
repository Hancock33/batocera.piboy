################################################################################
#
# libretro-fake08
#
################################################################################
# Version: Commits on Oct 14, 2022
LIBRETRO_FAKE08_VERSION = 74fc93696a439eb7d697af44216784b0f5995039
LIBRETRO_FAKE08_SITE = https://github.com/jtothebell/fake-08.git
LIBRETRO_FAKE08_SITE_METHOD = git
LIBRETRO_FAKE08_GIT_SUBMODULES = YES
LIBRETRO_FAKE08_LICENSE = MIT

define LIBRETRO_FAKE08_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
	$(@D)/platform/libretro platform="unix"
endef

define LIBRETRO_FAKE08_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/platform/libretro/fake08_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fake08_libretro.so
	# install core info file
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	cp -a $(@D)/platform/libretro/fake08_libretro.info $(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(generic-package))
