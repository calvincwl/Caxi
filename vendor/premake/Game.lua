project "Game"
    location "%{wks.location}"
    kind "ConsoleApp"
    language "C++"

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
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "CX_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "CX_DEBUG"
        buildoptions "/MDd"
        symbols "On"

    filter "configurations:Release"
        defines "CX_RELEASE"
        buildoptions "/MD"
        optimize "On"

    filter "configurations:Dist"
        defines "CX_DIST"
        buildoptions "/MD"
        optimize "On"
