#include "Caxi.h"

class ExampleLayer : public Caxi::Layer
{
public:
    ExampleLayer()
        : Layer("Example") {}

    void OnUpdate() override
    {
        CX_INFO("ExampleLayer::Update");
    }

    void OnEvent(Caxi::Event& event) override
    {
        CX_TRACE("{0}", event);
    }
};

class Game : public Caxi::Application
{
public:
    Game()
    {
        //PushLayer(new ExampleLayer());
    }

    ~Game()
    {
        
    }
};

Caxi::Application* Caxi::CreateApplication()
{
    return new Game();
}
