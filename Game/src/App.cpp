#include "Caxi.h"

class Game : public Caxi::Application
{
public:
	Game()
	{
		
	}

	~Game()
	{
		
	}
};

Caxi::Application* Caxi::CreateApplication()
{
	return new Game();
}
