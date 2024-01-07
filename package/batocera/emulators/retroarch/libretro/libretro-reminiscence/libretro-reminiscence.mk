################################################################################
#
# libretro-reminiscence
#
################################################################################
# Version: Commits on Jan 05, 2024
LIBRETRO_REMINISCENCE_VERSION = e21856941dcedee23026da8b2ca94708c14dae7f
LIBRETRO_REMINISCENCE_SITE = $(call github,libretro,REminiscence,$(LIBRETRO_REMINISCENCE_VERSION))
LIBRETRO_REMINISCENCE_LICENSE = GPL-3.0

LIBRETRO_REMINISCENCE_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_REMINISCENCE_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_REMINISCENCE_PLATFORM)"
endef

define LIBRETRO_REMINISCENCE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/reminiscence_libretro.so $(TARGET_DIR)/usr/lib/libretro/reminiscence_libretro.so
endef

$(eval $(generic-package))
