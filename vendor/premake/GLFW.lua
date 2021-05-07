project "GLFW"
	location "%{wks.location}"
	kind "StaticLib"
	language "C"

	targetdir ("../../bin/" .. outputdir .. "/%{prj.name}")
	objdir ("../../bin-int/" .. outputdir .. "/%{prj.name}")

	prjdir = "%{wks.location}" .. "/../Caxi/vendor/GLFW/"
	files
	{
		prjdir .. "include/GLFW/glfw3.h",
		prjdir .. "include/GLFW/glfw3native.h",
		prjdir .. "src/glfw_config.h",
		prjdir .. "src/context.c",
		prjdir .. "src/init.c",
		prjdir .. "src/input.c",
		prjdir .. "src/monitor.c",
		prjdir .. "src/vulkan.c",
		prjdir .. "src/window.c"
	}
	
	filter "system:linux"
		pic "On"

		systemversion "latest"
		staticruntime "On"

		files
		{
			prjdir .. "src/x11_init.c",
			prjdir .. "src/x11_monitor.c",
			prjdir .. "src/x11_window.c",
			prjdir .. "src/xkb_unicode.c",
			prjdir .. "src/posix_time.c",
			prjdir .. "src/posix_thread.c",
			prjdir .. "src/glx_context.c",
			prjdir .. "src/egl_context.c",
			prjdir .. "src/osmesa_context.c",
			prjdir .. "src/linux_joystick.c"
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		files
		{
			prjdir .. "src/win32_init.c",
			prjdir .. "src/win32_joystick.c",
			prjdir .. "src/win32_monitor.c",
			prjdir .. "src/win32_time.c",
			prjdir .. "src/win32_thread.c",
			prjdir .. "src/win32_window.c",
			prjdir .. "src/wgl_context.c",
			prjdir .. "src/egl_context.c",
			prjdir .. "src/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
