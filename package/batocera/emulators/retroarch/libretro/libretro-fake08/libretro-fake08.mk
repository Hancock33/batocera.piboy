################################################################################
#
# libretro-fake08
#
################################################################################
# Version: Commits on Jan 28, 2024
LIBRETRO_FAKE08_VERSION = 5a480cbf1f8ab1ef435f14d1206009f5fd56e588
LIBRETRO_FAKE08_SITE = https://github.com/jtothebell/fake-08.git
LIBRETRO_FAKE08_SITE_METHOD = git
LIBRETRO_FAKE08_GIT_SUBMODULES = YES
LIBRETRO_FAKE08_LICENSE = MIT

define LIBRETRO_FAKE08_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/platform/libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/platform/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
	$(@D)/platform/libretro platform="unix"
endef

define LIBRETRO_FAKE08_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info

	$(INSTALL) -D $(@D)/platform/libretro/fake08_libretro.so $(TARGET_DIR)/usr/lib/libretro/fake08_libretro.so
	cp -a $(@D)/platform/libretro/fake08_libretro.info       $(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(generic-package))
