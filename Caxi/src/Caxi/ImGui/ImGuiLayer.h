#pragma once

#include "Caxi/Layer.h"
#include "Caxi/Events/MouseEvent.h"
#include "Caxi/Events/KeyEvent.h"

namespace Caxi
{
    class CAXI_API ImGuiLayer : public Layer
    {
    public:
        ImGuiLayer();
        ~ImGuiLayer();

        void OnAttach() override;
        void OnDetach() override;
        void OnUpdate() override;
        void OnEvent(Event& event) override;
    };
}
