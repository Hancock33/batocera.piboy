config BR2_PACKAGE_HYDRACASTLELABYRINTH
	bool "hydracastlelabyrinth"
	depends on BR2_INSTALL_LIBSTDCPP
	select BR2_PACKAGE_SDL2
	select BR2_PACKAGE_SDL2_MIXER
	help
	  HYDRACASTLELABYRINTH
	  Hydra Castle Labyrinth is a platform game with some old school action. It's also reminiscent of games of the 16 bit era.

	  ptitseb.github.io/hydracastlelabyrinth
	  