#pragma once

#include "GLFW/glfw3.h"
#include "Caxi/Window.h"

namespace Caxi
{
    class WindowsWindow : public Window
    {
	public:
		WindowsWindow(const WindowProps& props);
		virtual ~WindowsWindow();

		void OnUpdate() override;

		uint32_t GetWidth() const override { return m_Data.Width; }
		uint32_t GetHeight() const override { return m_Data.Height; }

		// Window attributes
		void SetEventCallback(const EventCallbackFn& callback) override { m_Data.EventCallback = callback; }
		void SetVSync(bool enabled) override;
		bool IsVSync() const override;

	private:
		virtual void Init(const WindowProps& props);
		virtual void Shutdown();

		GLFWwindow* m_Window;

		struct WindowData
		{
			std::string Title;
			uint32_t Width;
		    uint32_t Height;
			bool VSync;

			EventCallbackFn EventCallback;
		};

		WindowData m_Data;
    };
}