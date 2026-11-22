################################################################################
#
# fake-hwclock
#
################################################################################
# Version: Commits on Jul 12, 2026
FAKE_HWCLOCK_VERSION = v0.15
FAKE_HWCLOCK_SITE = https://git.einval.com/git/fake-hwclock.git
FAKE_HWCLOCK_SITE_METHOD = git
FAKE_HWCLOCK_LICENSE = GPL-2.0
FAKE_HWCLOCK_LICENSE_FILES = COPYING

define FAKE_HWCLOCK_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/fake-hwclock $(TARGET_DIR)/usr/sbin/fake-hwclock
	$(INSTALL) -D -m 0750 $(@D)/debian/fake-hwclock.init $(TARGET_DIR)/etc/init.d/S47fake-hwclock
	mkdir -p $(TARGET_DIR)/etc/default
	echo 'FILE=/userdata/system/fake-hwclock.data' > $(TARGET_DIR)/etc/default/fake-hwclock
	# the init script sources lsb init-functions; provide an empty one if missing
	if [ ! -f $(TARGET_DIR)/lib/lsb/init-functions ]; then \
		mkdir -p $(TARGET_DIR)/lib/lsb && \
		echo '' > $(TARGET_DIR)/lib/lsb/init-functions; \
	fi
endef

$(eval $(generic-package))
