################################################################################
#
# gamenetworkingsockets
#
################################################################################
# Version: Commits on Dec 29, 2022
GAMENETWORKINGSOCKETS_VERSION = 725e273c7442bac7a8bc903c0b210b1c15c34d92
GAMENETWORKINGSOCKETS_SITE = https://github.com/ValveSoftware/GameNetworkingSockets
GAMENETWORKINGSOCKETS_SITE_METHOD = git
GAMENETWORKINGSOCKETS_GIT_SUBMODULES = YES
GAMENETWORKINGSOCKETS_SUPPORTS_IN_SOURCE_BUILD = NO
GAMENETWORKINGSOCKETS_LICENSE = BSD-3-Clause license
GAMENETWORKINGSOCKETS_LICENSE_FILES = LICENSE
GAMENETWORKINGSOCKETS_INSTALL_STAGING = YES

GAMENETWORKINGSOCKETS_DEPENDENCIES = openssl protobuf

$(eval $(cmake-package))
