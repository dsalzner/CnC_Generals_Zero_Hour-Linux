# Command & Conquer Generals

Get Cnc Generals Zero Hour running natively on Linux. 

## Plan

- [ ] cross-compile DirectX sample code from Linux with i686-w64-mingw32-g++-win32 for Windows and run with wine
- fix issues mingw32-g++ has with the code
  - [ ] case issues in directory names and header file names
  - [ ] missing includes errors
  - [ ] missing enum definition
- [ ] mock references to missing audio library
- [ ] remaining compilation/linking issues
- [ ] replace DirectX with OpenGL by introducing DirectX-to-OpenGL wrapper
- [ ] reintroduce audio

##