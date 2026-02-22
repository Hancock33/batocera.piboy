################################################################################
#
# gtk-layer-shell
#
################################################################################
# Version: Commits on Oct 29, 2025
GTK_LAYER_SHELL_VERSION = v0.10.0
GTK_LAYER_SHELL_SITE = $(call github,wmww,gtk-layer-shell,$(GTK_LAYER_SHELL_VERSION))
GTK_LAYER_SHELL_LICENSE = LGPL-3.0
GTK_LAYER_SHELL_LICENSE_FILES = LICENSE_LGPL.txt
GTK_LAYER_SHELL_INSTALL_STAGING = YES
GTK_LAYER_SHELL_DEPENDENCIES = libgtk3 wayland

GTK_LAYER_SHELL_CONF_OPTS = \
	-Dintrospection=true \
	-Dvapi=false \
	-Dtests=false \
	-Dexamples=false \
	-Ddocs=false

$(eval $(meson-package))
