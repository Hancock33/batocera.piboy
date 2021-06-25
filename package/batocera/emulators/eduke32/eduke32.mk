################################################################################
#
# EDUKE32
#
################################################################################
# Version.: Commits on Jun 19, 2021
EDUKE32_VERSION = 39e8f1852a9bd967145808d18c7597d47dc8d4a6
EDUKE32_SITE = https://voidpoint.io/terminx/eduke32.git

EDUKE32_DEPENDENCIES = sdl2 sdl2_image
EDUKE32_SITE_METHOD=git
EDUKE32_LICENSE = GPLv3

define EDUKE32_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f GNUmakefile HAVE_GTK2=0 USE_OPENGL=0
endef

define EDUKE32_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/eduke32 -D $(TARGET_DIR)/usr/bin/eduke32
endef

$(eval $(generic-package))
