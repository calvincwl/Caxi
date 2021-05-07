#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Caxi
{
    class CAXI_API Log
    {
    public:
        static void Init();

        inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
        inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

    private:
        static std::shared_ptr<spdlog::logger> s_CoreLogger;
        static std::shared_ptr<spdlog::logger> s_ClientLogger;
    };
}

// Core log macros
#define CX_CORE_TRACE(...) Caxi::Log::GetCoreLogger()->trace(__VA_ARGS__);
#define CX_CORE_DEBUG(...) Caxi::Log::GetCoreLogger()->debug(__VA_ARGS__);
#define CX_CORE_INFO(...) Caxi::Log::GetCoreLogger()->info(__VA_ARGS__);
#define CX_CORE_WARN(...) Caxi::Log::GetCoreLogger()->warn(__VA_ARGS__);
#define CX_CORE_ERROR(...) Caxi::Log::GetCoreLogger()->error(__VA_ARGS__);
#define CX_CORE_CRITICAL(...) Caxi::Log::GetCoreLogger()->critical(__VA_ARGS__);

// Client log macros
#define CX_TRACE(...) Caxi::Log::GetClientLogger()->trace(__VA_ARGS__);
//#define CX_DEBUG(...) Caxi::Log::GetClientLogger()->debug(__VA_ARGS__);
#define CX_INFO(...) Caxi::Log::GetClientLogger()->info(__VA_ARGS__);
#define CX_WARN(...) Caxi::Log::GetClientLogger()->warn(__VA_ARGS__);
#define CX_ERROR(...) Caxi::Log::GetClientLogger()->error(__VA_ARGS__);
#define CX_CRITICAL(...) Caxi::Log::GetClientLogger()->critical(__VA_ARGS__);
