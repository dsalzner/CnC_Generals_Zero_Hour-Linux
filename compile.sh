#!/bin/bash

# -- all code exluding tools, GeneralMD, sr_util.cpp
SRCS=$(find Generals/ | grep "\.cpp" |  grep -v 'lib/' | grep -v 'GeneralsMD/' | grep -v 'GeneralsMD/Code/Tools/' | grep -v 'Generals/Code/Tools/' | grep -v 'Generals/Code/Libraries/Source/WWVegas/WW3D2/sr_util.cpp' | awk '{ printf("%s ", $0); }')
#echo $SRCS

INCS="-I./Generals/Code/GameEngineDevice/Include/Win32Device/Common/ -I./Generals/Code/Tools/Autorun/ -I./Generals/Code/Tools/Launcher/Toolkit/Storage/ -I./Generals/Code/GameEngine/Include/Common/ -I./Generals/Code/Main/ -I./Generals/Code/Tools/ImagePacker/Include/ -I./Generals/Code/Tools/MapCacheBuilder/Include/ -I./Generals/Code/Tools/GUIEdit/Include/ -I./Generals/Code/Libraries/Include/ -I./Generals/Code/Tools/WW3D/pluglib/ -I./Generals/Code/Libraries/Source/WWVegas/WWLib/ -I./Generals/Code/Libraries/Source/WWVegas/WW3D2/ -I./Generals/Code/Libraries/Source/WWVegas/WWMath/ -I./Generals/Code/GameEngineDevice/Include/W3DDevice/GameClient/ -I./Generals/Code/Tools/matchbot/wlib/ -I./Generals/Code/Tools/mangler/wlib/ -I./Generals/Code/Tools/Launcher/ -I./Generals/Code/Libraries/Source/WWVegas/WWDebug/ -I./Generals/Code/Tools/Babylon/ -I./Generals/Code/Tools/WW3D/max2w3d/ -I./Generals/Code/GameEngine/Include/GameLogic/Module/ -I./Generals/Code/Tools/WorldBuilder/include/ -I./Generals/Code/Tools/wolSetup/ -I./Generals/Code/Tools/timingTest/ -I./Generals/Code/Tools/ParticleEditor/ -I./Generals/Code/Tools/DebugWindow/ -I./Generals/Code/Libraries/Source/Compression/  -I./Generals/Code/Tools/ImagePacker/Resource/ -I./Generals/Code/Tools/MapCacheBuilder/Resource/ -I./Generals/Code/GameEngine/Include/Precompiled/ -I./Generals/Code/Tools/Launcher/Toolkit/Debug/ -I./Generals/Code/Tools/mangler/ -I./Generals/Code/GameEngine/Include -I./Generals/Code/GameEngineDevice/Include -I./Generals/Code/GameEngineDevice/Source/ -I./Libraries/Source/WWVegas/  -I./lib/zlib-1.1.4/src/ -I./Generals/Code/GameEngine/Include/ -I./Generals/Code/Libraries/Source/WWVegas/ -I./Generals/Code/Libraries/Source/WWVegas/WWSaveLoad/ -I./Generals/Code/Libraries/Source/Compression/LZHCompress/  -I./lib/lzhl/ -I./lib/zlib-1.1.4/src/"

OPTS="-municode -msse2 -static-libgcc -static-libstdc++ -D_WINDOWS"

i686-w64-mingw32-g++-win32 -w $OPTS ${SRCS} -I/usr/share/mingw-w64/include ${INCS} -o main #2>&1 >/dev/null | grep "fatal error" | #awk -F'[ :]' '{ printf("%s;%s\n",  $1, $8) }' | tee missingheaders.tmp

#awk '!seen[$0]++' missingheaders.tmp > missingheaders-unique.txt
