################################################################################
#
# omf2097
#
################################################################################
# Version: Commits on Nov 21, 2026
OMF2097_VERSION = a68087dd534877fa0b2f21048f19da448637c4a0
OMF2097_SITE = $(call github,omf2097,openomf,$(OMF2097_VERSION))
OMF2097_EMULATOR_INFO = omf2097.emulator.yml
OMF2097_DEPENDENCIES = enet host-omf2097 libconfuse libminiupnpc sdl2 sdl2_mixer
OMF2097_LICENSE = MIT
OMF2097_SUPPORTS_IN_SOURCE_BUILD = NO

OMF2097_CONF_OPTS += -DUSE_NATPMP=OFF -DUSE_MINIUPNPC=OFF
OMF2097_CONF_OPTS += -DOMF_COMMAND_WRAPPER=$(HOST_OMF2097_BUILDDIR)/languagetool
HOST_OMF2097_CONF_OPTS += -DUSE_TOOLS=ON -DUSE_NATPMP=OFF -DUSE_MINIUPNPC=OFF

define OMF2097_POST_PROCESS
	# evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(OMF2097_PKGDIR)/omf2097.keys
endef

OMF2097_POST_INSTALL_TARGET_HOOKS += OMF2097_POST_PROCESS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
$(eval $(host-cmake-package))
