################################################################################
#
# libretro-fake08
#
################################################################################
# Version: Commits on Sept 05, 2023
LIBRETRO_FAKE08_VERSION = 87651609414a9ce4376a333787e0820d8e5c5623
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
	$(INSTALL) -D $(@D)/platform/libretro/fake08_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fake08_libretro.so
	# install core info file
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	cp -a $(@D)/platform/libretro/fake08_libretro.info $(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(generic-package))
