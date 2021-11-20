################################################################################
#
# rtkit
#
################################################################################
# Version.: Commits on Apr 05, 2020
RTKIT_VERSION = c295fa849f52b487be6433e69e08b46251950399
RTKIT_SITE = $(call github,heftig,RTKIT,$(RTKIT_VERSION))
# host-vim needed for xxd
RTKIT_DEPENDENCIES = dbus host-vim libcap polkit

define RTKIT_USERS
	rtkit -1 rtkit -1 * - - - Realtime Policy and Watchdog Daemon
endef

$(eval $(meson-package))
