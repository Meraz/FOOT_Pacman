#ifndef DEATHSCREEN_H
#define DEATHSCREEN_H

// #include "Player.h"
#include "BaseGameScreen.h"



class DeathScreen: public BaseGameScreen
{
public:
	DeathScreen();
	~DeathScreen();
	void StartUp(ID3D10Device* lDevice);
	void ShutDown();
	void ActivateScreen(GameScreenState lGameScreenState);
	void Draw();
	void Update();
private:
		
};

#endif
