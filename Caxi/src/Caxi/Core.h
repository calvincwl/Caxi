#pragma once

#ifdef CX_PLATFORM_WINDOWS
    #ifdef CX_BUILD_DLL
        #define CAXI_API __declspec(dllexport)
    #else
        #define CAXI_API __declspec(dllimport)
    #endif
#else
    #error Caxi only support Windows!
#endif

#define BIT(x) (1 << x)
