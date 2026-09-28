################################################################################
#
# shadps4-qtlauncher
#
################################################################################
# Version: Commits on Sept 28, 2026
SHADPS4_QTLAUNCHER_VERSION = c2fcf658335b6e83fb74713a33290c80a0cf9882
SHADPS4_QTLAUNCHER_SITE = https://github.com/shadps4-emu/shadps4-qtlauncher.git
SHADPS4_QTLAUNCHER_SITE_METHOD=git
SHADPS4_QTLAUNCHER_GIT_SUBMODULES=YES
SHADPS4_QTLAUNCHER_LICENSE = GPLv2
SHADPS4_QTLAUNCHER_LICENSE_FILE = LICENSE
SHADPS4_QTLAUNCHER_DEPENDENCIES += qt6base qt6multimedia qt6svg qt6tools shadps4

SHADPS4_QTLAUNCHER_SUPPORTS_IN_SOURCE_BUILD = NO

SHADPS4_QTLAUNCHER_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
SHADPS4_QTLAUNCHER_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SHADPS4_QTLAUNCHER_CONF_OPTS += -DENABLE_UPDATER=OFF

$(eval $(cmake-package))
