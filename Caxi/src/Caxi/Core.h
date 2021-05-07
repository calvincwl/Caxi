#pragma once

#ifdef CX_DEBUG
    #define CX_ENABLE_ASSERTS
#endif

#ifdef CX_PLATFORM_WINDOWS
    #ifdef CX_BUILD_DLL
        #define CAXI_API __declspec(dllexport)
    #else
        #define CAXI_API __declspec(dllimport)
    #endif
#else
    #error Caxi only support Windows!
#endif

#ifdef CX_ENABLE_ASSERTS
// Currently accepts at least the condition and one additional parameter (the message) being optional
#define CX_ASSERT(x, ...) { if(!(x)) { CX_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#define CX_CORE_ASSERT(x, ...) { if(!(x)) { CX_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
#define CX_ASSERT(...)
#define CX_CORE_ASSERT(...)
#endif

#define BIT(x) (1 << x)
