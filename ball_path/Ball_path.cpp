/*
Short task description:
1. Variables to input: row count, column count, starting point (x,y)
   destination point. 
2. Map based on those variables
3. Randomly located balls
4. Steps indicated by U D L R, last cell of a path is F
5. Number of steps
*/

#include <iostream>
#include <ctime>

using namespace std;

const char START = 'S';
const char FINISH = 'F';
const char EMPTYSPACE = '_';
const char BALL = '0';
const int VERYHIGHVALUE = 10000000;

struct Point //To set points on the map
{
	Point(int y=0, int x=0) : m_y(y), m_x(x) {}
	int m_y;
	int m_x;
};

class Map //To create Map and work with it
{
public:
	Map(const int &rows, const int &columns);	
	Map(const Map& right);
	~Map();
	Map &operator =(const Map& right);
	friend class Game;  //????
	void put(Point &p, const char &ch); //set Start Finish Balls Up Down Left Right 
 	char& getPoint(const Point &th) { return m_pTable[th.m_y][th.m_x]; } //[y][x]
	void show();
private:
	char **m_pTable;
	int m_nRows;   //rows == y
	int m_nColumns;//columns == x
};
Map::Map(const int& rows,const int& columns) :m_nRows(rows), m_nColumns(columns)
{
	m_pTable = new char *[m_nRows];            //y
	for (int i = 0; i < m_nRows; ++i)
		m_pTable[i] = new char[m_nColumns];    //x
	for (int i = 0; i < m_nRows; ++i)          //y
		for (int j = 0; j < m_nColumns; ++j)   //x
			m_pTable[i][j] = EMPTYSPACE;       //[y][x]
}
Map::Map(const Map& right) //Copy constructor
{
	m_nRows = right.m_nRows;
	m_nColumns = right.m_nColumns;
	m_pTable = new char *[m_nRows];                 //y
	for (int i = 0; i < m_nRows; ++i)
		m_pTable[i] = new char[m_nColumns];         //x
	for (int i = 0; i < m_nRows; ++i)               //y
		for (int j = 0; j < m_nColumns; ++j)        //x
			m_pTable[i][j] = right.m_pTable[i][j];  //[y][x]
}
Map::~Map()
{
	for (int i = 0; i < m_nRows; ++i) //???????
		delete[] m_pTable[i];
	delete[] m_pTable;
}
Map& Map::operator=(const Map& right)
{
	m_nRows = right.m_nRows;
	m_nColumns = right.m_nColumns;
	m_pTable = new char *[m_nRows];                 //y
	for (int i = 0; i < m_nRows; ++i)
		m_pTable[i] = new char[m_nColumns];         //x
	for (int i = 0; i < m_nRows; ++i)               //y
		for (int j = 0; j < m_nColumns; ++j)        //x
			m_pTable[i][j] = right.m_pTable[i][j];  //[y][x]
	return *this;
}
void Map::put(Point &p, const char &ch)
{
	while (p.m_x >= m_nColumns&&p.m_y >= m_nRows)
	{
		cout << "Point " << ch << ": (" << p.m_y << ","
			<< p.m_x << ") is out of frame!" << endl
			<< "Please enter the coordinates y and x in diapasones:\n"
			<< "for y: [0 to " << m_nRows-1 << "] and for x: [0 to " << m_nColumns-1 << "]\n"
			<< "y: ";
		cin >> p.m_y;
		cout << "x: ";
		cin >> p.m_x;
	}
	m_pTable[p.m_y][p.m_x] = ch;
}
void Map::show()
{
	for (int i = 0; i < m_nRows; ++i)       //y
	{
		for (int j = 0; j < m_nColumns; ++j) //x
			cout << m_pTable[i][j] << ' ';   //[y][x]
		cout << endl;
	}
	cout << endl;
}

class Game //Logic of the game and work with map
{
public:
	Game(const Point& start, const Point& finish,
		const int& row, const int& col);
	void show_result();
private:
	void add_balls(Map &M);
	void find_path(Map &M);
	const char cDirect[4] = { 'R','L','D','U' };
	Map m_mOriginMap;
	Map m_mShortestPath;
	Point m_pStart;
	Point m_pFinish;
	Point m_pCurPosit; //To move on a map
	int m_nMovesNumber = VERYHIGHVALUE;
};
Game::Game(const Point& start, const Point& finish,
	const int& row, const int& col)
	: m_mOriginMap(row, col), m_mShortestPath(m_mOriginMap),
	m_pStart(start), m_pFinish(finish), m_pCurPosit(m_pStart)
{
	m_mOriginMap.put(m_pStart, START);
	m_mOriginMap.put(m_pFinish, FINISH);
	add_balls(m_mOriginMap);

	cout << "This is a map without turns: " << endl;
	m_mOriginMap.show(); //Just to see the origin map 
	                     //without moves to compare it later
	find_path(m_mOriginMap);
}

void Game::show_result()
{
	if (m_nMovesNumber != VERYHIGHVALUE)
	{
		m_mShortestPath.show();
		cout << "Number of moves: " << m_nMovesNumber+1 << endl;
	}
	else cout << "There is no path to get 'F'" << endl;
}
void Game::add_balls(Map &M)
{
	srand(time(0));
	int nBallsAmount = M.m_nRows * M.m_nColumns /(rand()%7+3); //8 and 3 is just to correctly 
	Point p(0, 0);                                             //set random amount of balls
	for (int i = 0; i < nBallsAmount; ++i)
	{
		p.m_x = rand() % (M.m_nColumns);
		p.m_y = rand() % (M.m_nRows);
		if (M.getPoint(p) == EMPTYSPACE) 
			M.put(p,BALL);                
		else --i;
	}
}
void Game::find_path(Map &M)
{
	static int nTurns(0);
	for (int i = 1, iter = 0; iter < 4; i *= -1, ++iter) //iter 0 - right, 1 - left, 2 - up, 3 - down
	{                                                    //i = 1, -1, 1, -1
		if (iter < 2)m_pCurPosit.m_x += i; //+-x
		else m_pCurPosit.m_y += i;         //+-y

		if (m_pCurPosit.m_x >= 0 && m_pCurPosit.m_x < M.m_nColumns //[y][x]
			&&m_pCurPosit.m_y >= 0 && m_pCurPosit.m_y < M.m_nRows)
		{
			if (M.getPoint(m_pCurPosit) == FINISH)
			{
				if (nTurns < m_nMovesNumber)
				{
					m_nMovesNumber = nTurns;
					m_mShortestPath.~Map();
					m_mShortestPath = M;
				}
			}
			else if (M.getPoint(m_pCurPosit) == EMPTYSPACE)
			{
				M.put(m_pCurPosit, cDirect[iter]); 
				++nTurns;
				if (nTurns < m_nMovesNumber)    //To skip following cycles that can`t be right answer
					find_path(M);
				--nTurns; 
				M.put(m_pCurPosit, EMPTYSPACE); //return empty space instead of direction
			}
		}
		if (iter < 2) m_pCurPosit.m_x -= i;
		else m_pCurPosit.m_y -= i;
	}
}

void menu(Point &st, Point &fn, int &nRows, int &nColumns)
{
	int xST, yST, xFN, yFN;
	cout << "What parameters you wish to choose?\n"
		<< "1. Standart\n"
		<< "2. Your own\n";

	int cAnsw;
	cin >> cAnsw;

	switch (cAnsw)
	{
	case 1:
		st = Point(0, 0);
		fn = Point(9, 9);
		nRows = 10;
		nColumns = 10;
		break;
	case 2:
		
		cout << "Be careful with ranges!\n"
			<< "rows: ";
		cin >> nRows;
		cout << "columns: ";
		cin >> nColumns;
		cout
			<< "start:\n"
			<< "y(row): ";
		cin >> yST;
		cout << "x(column): ";
		cin >> xST;
		cout << "finish:\n"
			<< "y(row): ";
		cin >> yFN;
		cout << "x(column): ";
		cin >> xFN;
		st = Point(yST, xST);
		fn = Point(yFN, xFN);
		break;

	default:
		cout << "Wrong symbol, try again!\n\n";
		menu(st, fn, nRows, nColumns);
		break;
	}
}

int main()
{
	{
		Point pSt, pFn; //[y][x]
		int nRows, nColumns;
		menu(pSt, pFn, nRows, nColumns);
		Game mp(pSt, pFn, nRows, nColumns);
		cout << "Result: " << endl;
		mp.show_result(); 
	}
	if (_CrtDumpMemoryLeaks()) cout << "MemoryLeaks" << endl;
}
