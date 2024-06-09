################################################################################
#
# ecm
#
################################################################################
# Version: Commits on May 19, 2024
ECM_VERSION = v5.116.0
ECM_SITE =  $(call github,KDE,extra-cmake-modules,$(ECM_VERSION))
ECM_INSTALL_STAGING = YES
ECM_INSTALL_TARGET = NO
ECM_CONF_OPTS += -DBUILD_TESTING=OFF -DBUILD_HTML_DOCS=OFF -DBUILD_MAN_DOCS=OFF -DBUILD_QTHELP_DOCS=OFF

$(eval $(cmake-package))
