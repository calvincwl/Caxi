#pragma once
#include "Core.h"

namespace Caxi
{
	class CAXI_API Application
	{
	public:
		Application();
		virtual ~Application();
		
		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}


