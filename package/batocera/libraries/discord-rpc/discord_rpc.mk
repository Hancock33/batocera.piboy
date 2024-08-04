################################################################################
#
# discord-rpc
#
################################################################################
# Version: Commits on Aug 02, 2024
DISCORD_RPC_VERSION = 144f3a3f1209994d8d9e8a87964a989cb9911c1e
DISCORD_RPC_SITE = $(call github,stenzek,discord-rpc,$(DISCORD_RPC_VERSION))

DISCORD_RPC_LICENSE =  MIT-license
DISCORD_RPC_INSTALL_STAGING = YES
DISCORD_RPC_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
