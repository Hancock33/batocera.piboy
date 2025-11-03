################################################################################
#
# flatpak
#
################################################################################
# Version: Commits on Nov 03, 2025
FLATPAK_VERSION = 1.17.0
FLATPAK_SOURCE = flatpak-$(FLATPAK_VERSION).tar.xz
FLATPAK_SITE = https://github.com/flatpak/flatpak/releases/download/$(FLATPAK_VERSION)

FLATPAK_DEPENDENCIES += appstream glib-networking host-pkgconf host-python-pyparsing
FLATPAK_DEPENDENCIES += json-glib libarchive libcap libcurl libfuse3 libglib2 libgpgme
FLATPAK_DEPENDENCIES += libostree libseccomp pkgconf polkit python-pyparsing yaml-cpp
FLATPAK_DEPENDENCIES += hicolor-icon-theme adwaita-icon-theme adwaita-icon-theme-light

FLATPAK_CONF_OPTS += -Dsystem_install_dir=/userdata/saves/flatpak/binaries
FLATPAK_CONF_OPTS += -Drun_media_dir=/media
#FLATPAK_CONF_OPTS += -Dhttp_backend=soup
FLATPAK_CONF_OPTS += -Dselinux_module=disabled
FLATPAK_CONF_OPTS += -Dsystemd=disabled
FLATPAK_CONF_OPTS += -Ddocbook_docs=disabled
FLATPAK_CONF_OPTS += -Dtests=false

FLATPAK_CONF_ENV += LDFLAGS=-lpthread

define FLATPAK_INSTALL_SCRIPTS
	install -m 0755  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/utils/flatpak/batocera-flatpak-update $(TARGET_DIR)/usr/bin/
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/hooks
	ln -sf /usr/bin/batocera-flatpak-update $(TARGET_DIR)/usr/share/emulationstation/hooks/preupdate-gamelists-flatpak
	ln -sf /usr/bin/batocera-steam-update   $(TARGET_DIR)/usr/share/emulationstation/hooks/preupdate-gamelists-steam
endef

FLATPAK_POST_INSTALL_TARGET_HOOKS += FLATPAK_INSTALL_SCRIPTS

$(eval $(meson-package))
$(eval $(host-meson-package))
