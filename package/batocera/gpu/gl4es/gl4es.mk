################################################################################
#
# gl4es
#
################################################################################
# Version: Commits on Jan 13, 2026
GL4ES_VERSION = 1d69dd6a9867f8c2a9592e035ba00090f74071d7
GL4ES_SITE =  $(call github,ptitSeb,gl4es,$(GL4ES_VERSION))
GL4ES_DEPENDENCIES =
GL4ES_INSTALL_STAGING = YES
GL4ES_CONF_OPTS = -DNO_INIT_CONSTRUCTOR=ON

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),)
GL4ES_CONF_OPTS += -DNOX11=ON
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
GL4ES_DEPENDENCIES += mesa3d
endif

define GL4ES_FIX_SO
	cd $(STAGING_DIR)/usr/lib/gl4es && ln -sf libGL.so.1 libGL.so
endef

GL4ES_POST_INSTALL_STAGING_HOOKS += GL4ES_FIX_SO

$(eval $(cmake-package))
