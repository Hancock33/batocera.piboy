################################################################################
#
# grim
#
################################################################################
# Version: Commits on Jun 14, 2023
GRIM_VERSION = 1.4.1
GRIM_SITE = https://git.sr.ht/~emersion/grim/refs/download/v$(GRIM_VERSION)
GRIM_LICENSE = MIT
GRIM_LICENSE_FILES = LICENSE

GRIM_DEPENDENCIES = libpng pixman

ifeq ($(BR2_PACKAGE_WAYLAND),y)
GRIM_DEPENDENCIES += wayland wayland-protocols
endif

GRIM_CONF_OPTS = -Dman-pages=disabled -Dwerror=false

ifeq ($(BR2_riscv),y)
GRIM_CONF_OPTS += -Djpeg=disabled
endif

$(eval $(meson-package))
