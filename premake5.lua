workspace "Caxi"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Caxi"
	location "Caxi"
	kind "SharedLib"
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
		"%{prj.name}/vendor/spdlog/include"
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
	location "Game"
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
		"Caxi/vendor/spdlog/include",
		"Caxi/src"
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
