workspace "Caxi"
    location "build"
    architecture "x86_64"
    startproject "Game"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Caxi/vendor/GLFW/include"

include "vendor/premake/GLFW.lua"

project "Caxi"
    location "build"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "cxpch.h"
    pchsource "Caxi/src/cxpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"
    }

    links
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "CX_PLATFORM_WINDOWS",
            "CX_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Game")
        }

    filter "configurations:Debug"
        defines "CX_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "CX_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "CX_DIST"
        optimize "On"

project "Game"
    location "build"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Caxi/src",
        "Caxi/vendor/spdlog/include"
    }

    links
    {
        "Caxi"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "CX_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "CX_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "CX_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "CX_DIST"
        optimize "On"
