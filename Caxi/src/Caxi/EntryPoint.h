#pragma once

#ifdef CX_PLATFORM_WINDOWS

extern Caxi::Application* Caxi::CreateApplication();

int main(int argc, char** argv)
{
    Caxi::Log::Init();
    CX_CORE_WARN("Initialized Log!");
    int a = 5;
    CX_INFO("Hello! Var={0}", a);
    
    auto app = Caxi::CreateApplication();
    app->Run();
    delete app;
    
    return 0;
}

#endif
