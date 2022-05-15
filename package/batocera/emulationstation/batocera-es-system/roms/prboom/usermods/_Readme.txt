The DOOM engines support countless number of third-party WADs called PWADs (or “Patch WADs”) built by diligent members of the DOOM community over the past 28 or so years. 
Every PWAD needs a specific IWAD in order to work so we need to create a .uwad file with the following line entries ...

---- Start of .uwad file ----
IWAD=/userdata/roms/prdoom/doom.wad
PWAD=/userdata/roms/prboom/usermods/BrutalDoomPlatinumv2.0.pk3
---- End of .uwad file ----

Note 1. You cannot run mods with the shareware or demo versions
Note 2. The filepath is case sensitive.
Note 3. PK3 files are only compatable with GZDOOM
