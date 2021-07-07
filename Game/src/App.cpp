#include "Caxi.h"

class ExampleLayer : public Caxi::Layer
{
public:
    ExampleLayer()
        : Layer("Example") {}

    void OnUpdate() override
    {
        //CX_INFO("ExampleLayer::Update");
    }

    void OnEvent(Caxi::Event& event) override
    {
        if (event.GetEventType() == Caxi::EventType::KeyPressed)
        {
            auto& e = dynamic_cast<Caxi::KeyPressedEvent&>(event);
            CX_TRACE("{0}", static_cast<char>(e.GetKeyCode()));
        }
    }
};

class Game : public Caxi::Application
{
public:
    Game()
    {
        PushLayer(new ExampleLayer());
        PushOverlay(new Caxi::ImGuiLayer());
    }

    ~Game()
    {
        
    }
};

Caxi::Application* Caxi::CreateApplication()
{
    return new Game();
}
