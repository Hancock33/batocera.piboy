################################################################################
#
# zmusic
#
################################################################################
# Version: Commits on Apr 02, 2023
ZMUSIC_VERSION = fc30a8f1e4350dba68e23bb702dfa24df3fe525e
ZMUSIC_SITE = $(call github,ZDoom,ZMusic,$(ZMUSIC_VERSION))
ZMUSIC_LICENSE = GPLv3
ZMUSIC_SUPPORTS_IN_SOURCE_BUILD = NO
ZMUSIC_INSTALL_STAGING = YES
ZMUSIC_DEPENDENCIES = zlib mpg123 libsndfile alsa-lib host-gzdoom host-ninja

ZMUSIC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define ZMUSIC_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(ZMUSIC_BUILDDIR)
endef

define ZMUSIC_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(ZMUSIC_BUILDDIR)
endef

define ZMUSIC_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(ZMUSIC_BUILDDIR)
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
