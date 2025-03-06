#!/bin/bash

cd lib/

wget https://github.com/edgeforce/directx8/archive/e6fa10f5f92bf523c15fdb068206ce25c8d2121d.zip
wget https://github.com/microsoft/DirectXMath/archive/126bcb541afd4af2f95c419143682c183037e799.zip
wget https://github.com/microsoft/DXUT/archive/438cba4545b5f3f3db0487249eb2dbc22b24e7db.zip
wget https://github.com/ryandrake08/lzhl/archive/ba3ac10ac76c3cf9a875ef477f45563865e2161a.zip

for file in *.zip
do
 unzip "$file"
done

mv "directx8-e6fa10f5f92bf523c15fdb068206ce25c8d2121d" directx8
mv "DirectXMath-126bcb541afd4af2f95c419143682c183037e799" directx-math
mv "DXUT-438cba4545b5f3f3db0487249eb2dbc22b24e7db" directx-dxut
mv "lzhl-ba3ac10ac76c3cf9a875ef477f45563865e2161a" lzhl

wget "https://osdn.net/frs/g_redir.php?m=jaist&f=stlport%2FSTLport+archive%2FSTLport+4%2FSTLport-4.5.3.tar.gz" -O stlport-4.5.3.tar.gz
tar -xvf stlport-4.5.3.tar.gz
mv "STLport-4.5.3" stlport

wget https://sourceforge.net/projects/gnuwin32/files/zlib/1.1.4/zlib-1.1.4-src.zip/download -O zlib-1.1.4.zip
unzip zlib-1.1.4.zip -d zlib-1.1.4

sed -i 's/\#include <Windows.h>/#include <windows.h>/g' directx-dxut/Core/DXUT.h
sed -i 's/\#include <Windows.h>/#include <windows.h>/g' directx-dxut/Core/dxerr.h
sed -i 's/\#include <wrl\client.h>/#include <wrl\/client.h>/g' directx-dxut/Core/WICTextureLoader.cpp
sed -i 's/\#include <wrl\client.h>/#include <wrl\/client.h>/g' directx-dxut/Core/ScreenGrab.cpp

sed -i 's/\#include <wrl\client.h>/#include <wrl\/client.h>/g' directx-math/SHMath/DirectXSHD3D11.cpp
sed -i 's/\#include <wrl\client.h>/#include <wrl\/client.h>/g' directx-math/SHMath/DirectXSHD3D12.cpp

