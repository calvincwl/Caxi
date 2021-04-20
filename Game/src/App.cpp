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

int main()
{
	Game* game = new Game();
	game->Run();
	delete game;

	return 0;
}
