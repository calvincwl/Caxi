#pragma once

#include "Core.h"
#include "Caxi/LayerStack.h"
#include "Caxi/Events/ApplicationEvent.h"
#include "Window.h"

namespace Caxi
{
    class CAXI_API Application
    {
    public:
        Application();
        virtual ~Application();
        
        void Run();

        void OnEvent(Event& e);

        void PushLayer(Layer* layer);
        void PushOverlay(Layer* overlay);

    private:
        bool OnWindowClose(WindowCloseEvent& e);

        std::unique_ptr<Window> m_Window;
        bool m_Running = true;
        LayerStack m_LayerStack;
    };

    // To be defined in CLIENT
    Application* CreateApplication();
}


