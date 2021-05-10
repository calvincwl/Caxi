project "Game"
    location "%{wks.location}"
    kind "ConsoleApp"
    language "C++"
    staticruntime "off"

    targetdir ("%{PremakeDir.target}")
    objdir ("%{PremakeDir.object}")

    files
    {
        "%{PremakeDir.root}/%{prj.name}/src/**.h",
        "%{PremakeDir.root}/%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{PremakeDir.root}/Caxi/src",
        "%{PremakeDir.root}/Caxi/vendor/spdlog/include"
    }

    links
    {
        "Caxi"
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

        defines
        {
            "CX_PLATFORM_WINDOWS"
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
