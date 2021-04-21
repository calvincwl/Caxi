#pragma once
#include <stdio.h>

#ifdef CX_PLATFORM_WINDOWS

extern Caxi::Application* Caxi::CreateApplication();

int main(int argc, char** argv)
{
	printf("Hello World!");
	auto app = Caxi::CreateApplication();
	app->Run();
	delete app;
	
	return 0;
}

#endif
