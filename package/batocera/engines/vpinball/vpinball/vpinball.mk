################################################################################
#
# vpinball
#
################################################################################
# Version: Commits on Nov 22, 2026
VPINBALL_VERSION = 30ed4849fb182314a47b9632979c39e7250c7f84
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPL-3.0+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO
VPINBALL_EMULATOR_INFO = vpinball.emulator.yml

VPINBALL_DEPENDENCIES = host-bgfx bgfx ffmpeg libaltsound libdmdutil libdof
VPINBALL_DEPENDENCIES += libfreeimage libmysofa libogg libpinmame libpupdmd
VPINBALL_DEPENDENCIES += libserum libspatialaudio libvni libwinevbs openxr-sdk
VPINBALL_DEPENDENCIES += opus opusfile sdl3 sdl3_image sdl3_ttf zlib

VPINBALL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)
VPINBALL_CONF_OPTS += -DRENDERER=BGFX
VPINBALL_CONF_OPTS += -DENABLE_XR=ON
VPINBALL_CONF_OPTS += -DUSE_SYSTEM_LIBS=ON
VPINBALL_CONF_OPTS += -DSYSTEM_LIBS_INCLUDE_DIR=$(STAGING_DIR)/usr/include
VPINBALL_CONF_OPTS += -DSYSTEM_LIBS_LIB_DIR=$(STAGING_DIR)/usr/lib
VPINBALL_CONF_OPTS += -DVPX_SHADERC=$(HOST_DIR)/bin/shaderc

define VPINBALL_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/vpinball
	$(INSTALL) -D -m 0755 $(VPINBALL_BUILDDIR)/VPinballX_BGFX $(TARGET_DIR)/usr/bin/vpinball/VPinballX_BGFX
	cp -R $(VPINBALL_BUILDDIR)/assets $(VPINBALL_BUILDDIR)/plugins $(VPINBALL_BUILDDIR)/scripts $(TARGET_DIR)/usr/bin/vpinball/
	$(INSTALL) -D -m 0755 $(VPINBALL_PKGDIR)/batocera-vpx-scraper.py $(TARGET_DIR)/usr/bin/batocera-vpx-scraper
	$(INSTALL) -D -m 0644 $(VPINBALL_PKGDIR)/vpinball.keys $(TARGET_DIR)/usr/share/evmapy/vpinball.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
