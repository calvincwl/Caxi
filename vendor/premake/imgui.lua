project "ImGui"
    location "%{wks.location}"
    kind "StaticLib"
    language "C++"

    targetdir ("%{PremakeDir.target}")
    objdir ("%{PremakeDir.object}")

    files
    {
        "%{PremakeDir.vendor}/imconfig.h",
        "%{PremakeDir.vendor}/imgui.cpp",
        "%{PremakeDir.vendor}/imgui.h",
        "%{PremakeDir.vendor}/imgui_demo.cpp",
        "%{PremakeDir.vendor}/imgui_draw.cpp",
        "%{PremakeDir.vendor}/imgui_internal.h",
        "%{PremakeDir.vendor}/imgui_tables.cpp",
        "%{PremakeDir.vendor}/imgui_widgets.cpp",
        "%{PremakeDir.vendor}/imstb_rectpack.h",
        "%{PremakeDir.vendor}/imstb_textedit.h",
        "%{PremakeDir.vendor}/imstb_truetype.h",
        "%{PremakeDir.vendor}/backends/imgui_impl_opengl3.h",
        "%{PremakeDir.vendor}/backends/imgui_impl_opengl3.cpp",
        "%{PremakeDir.vendor}/backends/imgui_impl_glfw.h",
        "%{PremakeDir.vendor}/backends/imgui_impl_glfw.cpp"
    }

    includedirs
    {
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}"
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
