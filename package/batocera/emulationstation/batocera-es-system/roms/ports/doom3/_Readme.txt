### Getting the Doom3 Game Data ###
You’ll need the game data from a Doom3 installation patched to 1.3.1. Specifically, you’ll need the following .pk4 files for the main game:

Filename	Size	MD5-sum
base/pak000.pk4	337MB	71b8d37b2444d3d86a36fd61783844fe
base/pak001.pk4	220MB	4bc4f3ba04ec2b4f4837be40e840a3c1
base/pak002.pk4	398MB	fa84069e9642ad9aa4b49624150cc345
base/pak003.pk4	303MB	f22d8464997924e4913e467e7d62d5fe
base/pak004.pk4	227MB	38561a3c73f93f2e6fd31abf1d4e9102
base/pak005.pk4	540KB	2afd4ece27d36393b7538d55a345b90d
base/pak006.pk4	214KB	a6e7003fa9dcc75073dc02b56399b370
base/pak007.pk4	118KB	6319f086f930ec1618ab09b4c20c268c
base/pak008.pk4	12KB	28750b7841de9453eb335bad6841a2a5
… and (optionally) these .pk4 files for the Resurrection of Evil addon:

Filename	Size	MD5-sum
d3xp/pak000.pk4	514MB	a883fef0fd10aadeb73d34c462ff865d
d3xp/pak001.pk4	98KB	06fc9be965e345587064056bf22236d2
(You can also use the Demo version of Doom3, see below)

### Using the Doom3 Demo gamedata ###
First you need to download the Doom3 Demo, of course.

For Windows, you can get D3Demo.exe at Fileplanet and just run the installer.

For Linux (and other operating systems that have a POSIX-compatible shell and tar) you can download doom3-linux-1.1.1286-demo.x86.run from Holarse or some other page that has that file.
Then you can extract the relevant file from the .run installer with

sh doom3-linux-1.1.1286-demo.x86.run --tar xf demo/

You’ll need demo/demo00.pk4 for playing, either in exactly that directory, or you can copy it into base/.
Note that you don’t need the patches of the full version, adding their pk4s when using Demo gamedata breaks the game.

demo00.pk4 has a size of 462MB but there are minimal differences between the one for Linux and Windows, so they have different md5sums:
Windows : md5sum bd410abbb649b9512d65b794869df9fe size 483534533 Bytes
Linux   : md5sum 70c2c63ef1190158f1ebd6c255b22d8e size 483535485 Bytes