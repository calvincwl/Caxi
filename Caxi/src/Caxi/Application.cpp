#include "cxpch.h"
#include "Application.h"

#include "Caxi/Log.h"
#include "GLFW/glfw3.h"

namespace Caxi
{
#define CX_BIND_EVENT_FN(x) std::bind(&Application::x, this, std::placeholders::_1)

    Application::Application()
    {
        m_Window = std::unique_ptr<Window>(Window::Create());
        m_Window->SetEventCallback(CX_BIND_EVENT_FN(OnEvent));
    }

    Application::~Application()
    {
        
    }

    void Application::OnEvent(Event& e)
    {
        EventDispatcher dispatcher(e);
        dispatcher.Dispatch<WindowCloseEvent>(CX_BIND_EVENT_FN(OnWindowClose));

        CX_CORE_TRACE("{0}", e);
    }
    
    void Application::Run()
    {
        while (m_Running)
        {
            glClearColor(0, 1, 1, 1);
            glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
            m_Window->OnUpdate();
        }
    }

    bool Application::OnWindowClose(WindowCloseEvent& e)
    {
        m_Running = false;
        return true;
    }
}
