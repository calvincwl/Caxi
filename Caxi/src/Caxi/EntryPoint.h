#pragma once

#ifdef CX_PLATFORM_WINDOWS

extern Caxi::Application* Caxi::CreateApplication();

int main(int argc, char** argv)
{
    Caxi::Log::Init();
    CX_CORE_WARN("Initialized Log!");
    
    auto app = Caxi::CreateApplication();
    app->Run();
    delete app;
}

#endif
