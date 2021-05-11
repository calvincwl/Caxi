project "Caxi"
    location "%{wks.location}"
    kind "SharedLib"
    language "C++"
    staticruntime "off"

    targetdir ("%{PremakeDir.target}")
    objdir ("%{PremakeDir.object}")

    pchheader "cxpch.h"
    pchsource "../../%{prj.name}/src/cxpch.cpp"

    files
    {
        "%{PremakeDir.root}/%{prj.name}/src/**.h",
        "%{PremakeDir.root}/%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{PremakeDir.root}/%{prj.name}/src",
        "%{PremakeDir.root}/%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

        defines
        {
            "CX_PLATFORM_WINDOWS",
            "CX_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} " .. "\"%{PremakeDir.root}/bin/%{PremakeDir.output}/Game/\"")
        }

    filter "configurations:Debug"
        defines "CX_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "CX_RELEASE"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "CX_DIST"
        runtime "Release"
        optimize "On"
