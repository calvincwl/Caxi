project "Glad"
    location "%{wks.location}"
    kind "StaticLib"
    language "C"
    staticruntime "on"

    targetdir ("%{PremakeDir.target}")
    objdir ("%{PremakeDir.object}")

    files
    {
        "%{PremakeDir.vendor}/include/glad/glad.h",
        "%{PremakeDir.vendor}/include/KHR/khrplatform.h",
        "%{PremakeDir.vendor}/src/glad.c"
    }

    includedirs
    {
        "%{PremakeDir.vendor}/include"
    }
    
    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
