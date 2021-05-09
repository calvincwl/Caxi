project "GLFW"
	location "%{wks.location}"
	kind "StaticLib"
	language "C"
    staticruntime "on"

    targetdir ("%{PremakeDir.target}")
    objdir ("%{PremakeDir.object}")

	files
	{
		"%{PremakeDir.vendor}/include/GLFW/glfw3.h",
		"%{PremakeDir.vendor}/include/GLFW/glfw3native.h",
		"%{PremakeDir.vendor}/src/glfw_config.h",
		"%{PremakeDir.vendor}/src/context.c",
		"%{PremakeDir.vendor}/src/init.c",
		"%{PremakeDir.vendor}/src/input.c",
		"%{PremakeDir.vendor}/src/monitor.c",
		"%{PremakeDir.vendor}/src/vulkan.c",
		"%{PremakeDir.vendor}/src/window.c"
	}
	
	filter "system:linux"
		pic "On"

		systemversion "latest"
		staticruntime "On"

		files
		{
			"%{PremakeDir.vendor}/src/x11_init.c",
			"%{PremakeDir.vendor}/src/x11_monitor.c",
			"%{PremakeDir.vendor}/src/x11_window.c",
			"%{PremakeDir.vendor}/src/xkb_unicode.c",
			"%{PremakeDir.vendor}/src/posix_time.c",
			"%{PremakeDir.vendor}/src/posix_thread.c",
			"%{PremakeDir.vendor}/src/glx_context.c",
			"%{PremakeDir.vendor}/src/egl_context.c",
			"%{PremakeDir.vendor}/src/osmesa_context.c",
			"%{PremakeDir.vendor}/src/linux_joystick.c"
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
			"%{PremakeDir.vendor}/src/win32_init.c",
			"%{PremakeDir.vendor}/src/win32_joystick.c",
			"%{PremakeDir.vendor}/src/win32_monitor.c",
			"%{PremakeDir.vendor}/src/win32_time.c",
			"%{PremakeDir.vendor}/src/win32_thread.c",
			"%{PremakeDir.vendor}/src/win32_window.c",
			"%{PremakeDir.vendor}/src/wgl_context.c",
			"%{PremakeDir.vendor}/src/egl_context.c",
			"%{PremakeDir.vendor}/src/osmesa_context.c"
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
