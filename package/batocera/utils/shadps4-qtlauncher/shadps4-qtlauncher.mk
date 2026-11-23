################################################################################
#
# shadps4-qtlauncher
#
################################################################################
# Version: Commits on Nov 23, 2026
SHADPS4_QTLAUNCHER_VERSION = 1f9030088d4e69f9c47cea22e0c1433368d238ac
SHADPS4_QTLAUNCHER_SITE = https://github.com/shadps4-emu/shadps4-qtlauncher.git
SHADPS4_QTLAUNCHER_SITE_METHOD = git
SHADPS4_QTLAUNCHER_GIT_SUBMODULES = YES
SHADPS4_QTLAUNCHER_LICENSE = GPL-2.0+
SHADPS4_QTLAUNCHER_LICENSE_FILES = LICENSE
SHADPS4_QTLAUNCHER_SUPPORTS_IN_SOURCE_BUILD = NO

SHADPS4_QTLAUNCHER_DEPENDENCIES += qt6base qt6multimedia qt6svg qt6tools
SHADPS4_QTLAUNCHER_DEPENDENCIES += fmt openal openssl sdl3 vulkan-headers

SHADPS4_QTLAUNCHER_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
SHADPS4_QTLAUNCHER_CONF_OPTS += -DENABLE_UPDATER=OFF

$(eval $(cmake-package))
