################################################################################
#
# discord_rpc
#
################################################################################
# Version: Commits on Mar 30, 2025
DISCORD_RPC_VERSION = cc59d26d1d628fbd6527aac0ac1d6301f4978b92
DISCORD_RPC_SITE = $(call github,stenzek,discord-rpc,$(DISCORD_RPC_VERSION))

DISCORD_RPC_LICENSE =  MIT-license
DISCORD_RPC_INSTALL_STAGING = YES
DISCORD_RPC_SUPPORTS_IN_SOURCE_BUILD = NO

$(eval $(cmake-package))
