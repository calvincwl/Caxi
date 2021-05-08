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

PremakeDir = {}
PremakeDir["root"] = "%{wks.location}/.."
PremakeDir["output"] = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
PremakeDir["vendor"] = "%{wks.location}/../Caxi/vendor/%{prj.name}"
PremakeDir["target"] = "%{wks.location}/../bin/%{PremakeDir.output}/%{prj.name}"
PremakeDir["object"] = "%{wks.location}/../bin-int/%{PremakeDir.output}/%{prj.name}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "%{PremakeDir.root}/Caxi/vendor/GLFW/include"
IncludeDir["Glad"] = "%{PremakeDir.root}/Caxi/vendor/Glad/include"

include "vendor/premake/GLFW.lua"
include "vendor/premake/Glad.lua"
include "vendor/premake/Caxi.lua"
include "vendor/premake/Game.lua"
