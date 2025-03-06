# Command & Conquer Generals

Get Cnc Generals Zero Hour running natively on Linux. 

## Get Dependencies

```sh
./dependencies.sh
```

## Plan

- [x] cross-compile DirectX sample code from Linux with i686-w64-mingw32-g++-win32 for Windows and run with wine
- [x] setup dependencies
- fix issues mingw32-g++ has with the code
  - [x] case issues in directory names and header file names
  - [ ] missing includes errors
  - [ ] missing enum definition
- [ ] mock references to missing audio library
- [ ] remaining compilation/linking issues
- [ ] replace DirectX with OpenGL by introducing DirectX-to-OpenGL wrapper
- [ ] reintroduce audio

##