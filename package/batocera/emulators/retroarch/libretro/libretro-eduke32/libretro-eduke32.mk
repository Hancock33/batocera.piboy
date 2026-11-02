################################################################################
#
# libretro-eduke32
#
################################################################################
# Version: Commits on Nov 02, 2026
LIBRETRO_EDUKE32_VERSION = b5918d5cf3fc698700c86693fce3ce5200c28b96
LIBRETRO_EDUKE32_SITE = https://github.com/cscd98/eduke32-libretro.git
LIBRETRO_EDUKE32_SITE_METHOD = git
LIBRETRO_EDUKE32_GIT_SUBMODULES = YES
LIBRETRO_EDUKE32_LICENSE = GPL-2.0, BUILDLIC
LIBRETRO_EDUKE32_LICENSE_FILES = source/duke3d/gpl-2.0.txt source/build/buildlic.txt
LIBRETRO_EDUKE32_DEPENDENCIES = retroarch
LIBRETRO_EDUKE32_EMULATOR_INFO = eduke32.libretro.core.yml

# desktop OpenGL on x86_64, OpenGL ES 3 elsewhere
ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
LIBRETRO_EDUKE32_EXTRA_ARGS += USE_OPENGLES=1
endif

define LIBRETRO_EDUKE32_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-narrowing|g" $(@D)/platform/Libretro/Makefile.libretro
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/platform/Libretro -f Makefile.libretro \
		CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
		DEBUG=0 $(LIBRETRO_EDUKE32_EXTRA_ARGS)
endef

define LIBRETRO_EDUKE32_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/platform/Libretro/eduke32_libretro.so $(TARGET_DIR)/usr/lib/libretro/eduke32_libretro.so
	$(INSTALL) -D -m 0644 $(LIBRETRO_EDUKE32_PKGDIR)/eduke32_libretro.info $(TARGET_DIR)/usr/share/libretro/info/eduke32_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
