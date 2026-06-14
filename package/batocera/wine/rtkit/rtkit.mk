################################################################################
#
# rtkit
#
################################################################################
# Version: Commits on Dec 11, 2025
RTKIT_VERSION = v0.14
RTKIT_SOURCE = rtkit-$(RTKIT_VERSION).tar.gz
RTKIT_SITE = https://gitlab.freedesktop.org/pipewire/rtkit/-/archive/$(RTKIT_VERSION)
RTKIT_DEPENDENCIES = dbus libcap polkit

define RTKIT_USERS
	rtkit -1 rtkit -1 * - - - Realtime Policy and Watchdog Daemon
endef

$(eval $(meson-package))
