################################################################################
#
# discord-rpc
#
################################################################################
# Version: Commits on Jul 04, 2024
DISCORD_RPC_VERSION = 842c15192041f8e71c512851834f4dadb1a554fb
DISCORD_RPC_SITE = $(call github,stenzek,discord-rpc,$(DISCORD_RPC_VERSION))

DISCORD_RPC_LICENSE =  MIT-license
DISCORD_RPC_INSTALL_STAGING = YES
DISCORD_RPC_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
