################################################################################
#
# gl4es
#
################################################################################
# Version: Commits on Jun 01, 2024
GL4ES_VERSION = 52e0c496f513cac4bfb23b8897e8028396fcd61f
GL4ES_SITE =  $(call github,ptitSeb,gl4es,$(GL4ES_VERSION))
GL4ES_DEPENDENCIES =
GL4ES_INSTALL_STAGING = YES
GL4ES_CONF_OPTS = -DNO_INIT_CONSTRUCTOR=ON
#-DNOEGL=ON -DGLX_STUBS=OFF -DNO_LOADER=ON

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),)
GL4ES_CONF_OPTS += -DNOX11=ON
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
GL4ES_DEPENDENCIES += mesa3d
endif

define GL4ES_FIX_SO
	cd $(STAGING_DIR)/usr/lib/gl4es && ln -s libGL.so.1 libGL.so
endef

GL4ES_POST_INSTALL_STAGING_HOOKS += GL4ES_FIX_SO

$(eval $(cmake-package))
