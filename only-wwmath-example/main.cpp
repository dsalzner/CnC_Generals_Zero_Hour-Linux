#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

int WINAPI wWinMain(_In_ HINSTANCE hInstance, _In_opt_ HINSTANCE hPrevInstance, _In_ LPWSTR lpCmdLine, _In_ int nCmdShow) {
  float y = 2.0f;
  float x = sinf(y);
  return 0;
}
