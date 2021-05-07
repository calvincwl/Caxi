#include "cxpch.h"
#include "LayerStack.h"

namespace Caxi
{
    LayerStack::LayerStack()
    {
        m_LayerInsert = m_Layers.begin();
    }

    LayerStack::~LayerStack()
    {
        for(Layer* layer : m_Layers)
        {
            delete layer;
        }
    }

    void LayerStack::PushLayer(Layer* layer)
    {
        
    }
}
