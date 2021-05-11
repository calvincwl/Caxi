#pragma once

#include "Caxi/Core.h"
#include "Caxi/Events/Event.h"

namespace Caxi
{
    class CAXI_API Input
    {
    public:
        static bool IsKeyPressed(int keycode) { return s_Instance->IsKeyPressedImpl(keycode); }
        static bool IsMouseButtonPressed(int button) { return s_Instance->IsMouseButtonPressedImpl(button); }
        static float GetMouseX() { return s_Instance->GetMouseXImpl(); }
        static float GetMouseY() { return s_Instance->GetMouseYImpl(); }

    protected:
        virtual bool IsKeyPressedImpl(int keycode) = 0;
        virtual bool IsMouseButtonPressedImpl(int button) = 0;
        virtual float GetMouseXImpl() = 0;
        virtual float GetMouseYImpl() = 0;

    private:
        static Input* s_Instance;
    };
}
