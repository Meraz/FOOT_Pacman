DV1435 Vt12 Lp4 F�rdjupning i objektorienterade tekniker
==================
Rasmus Tilljander
Erik H�rlin
Kim Hansson
Calle Ketola
Andreas Nilsson
==================



F�rslag till programmeringsstandarder
=====================================
Variabler
	B�rja alltid med liten bokstav
	Vid flerord variabelsnamn s� stor bokstav p� varje nytt ord, ihopsatt utan delare s� som "_".
	Medlemsvariabler: prefix 'm' (ex. int mLevel)
	Parameterlistor: prefix 'l'
	Lokalt skapade variabler: prefix 'l' eller 'temp'
	Konstanta variabler: Ingen prefix, stor bokstav i b�rjan (ex. const int WorldSize = 5;), alternativt 'g' eller 'c'

Funktioner
	B�rja med stor bokstav
	Vid flerord funktionsnamn s� stor bokstav p� varje nytt ord, ihopsatt utan delare s� som "_".
	Alla "get" funktioner b�r vara konstanta (ex. int GetLevel() const;)
	Bra l�nk: http://vimeo.com/13702091