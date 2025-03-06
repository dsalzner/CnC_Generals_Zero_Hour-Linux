#!/bin/bash

cd lib/

wget https://github.com/edgeforce/directx8/archive/e6fa10f5f92bf523c15fdb068206ce25c8d2121d.zip
wget https://github.com/microsoft/DirectXMath/archive/126bcb541afd4af2f95c419143682c183037e799.zip
wget https://github.com/microsoft/DXUT/archive/438cba4545b5f3f3db0487249eb2dbc22b24e7db.zip

for file in *.zip
do
 unzip "$file"
done

mv "directx8-e6fa10f5f92bf523c15fdb068206ce25c8d2121d" directx8
mv "DirectXMath-126bcb541afd4af2f95c419143682c183037e799" directx-math
mv "DXUT-438cba4545b5f3f3db0487249eb2dbc22b24e7db" directx-dxut

sed -i 's/\#include <Windows.h>/\/\/#include <windows.h>/g' directx-dxut/Core/DXUT.h
sed -i 's/\#include <Windows.h>/\/\/#include <windows.h>/g' directx-dxut/Core/dxerr.h
