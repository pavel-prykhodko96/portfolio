#include <iostream>
#include <vector>
using namespace std;

enum COLORS { BLACK, RED, BLUE, GREEN, YELLOW, WHITE };
enum POSITIONS { CENTER, NORWES, NOREAS, EAST, SOUEAS, SOUWES, WEST };
const int COLORSSCORE = 6;
const int WHEELSSCORE = 7;
const int POSITIONSSCORE = 7;

struct Wheel
{//Here colors have same meaning as directions 
	Wheel(int col1, int col2, int col3, int col4, int col5, int col6, int ind) 
		: m_vColors{ col1,  col2,  col3,  col4,  col5,  col6 }, m_nWheelInd(ind){}

	vector <int> m_vColors;
	const int m_nWheelInd;
	bool m_bIsBusy = false;
};
class Position
{
public:
	Position(int pos) :m_nThisPosition(pos) {};
	const int m_nThisPosition;
	int m_nColorTowardCenterInd;
	Wheel* m_pWheel;
	int next_color();
	int previous_color();
};
int Position::next_color()
{
	if (m_nColorTowardCenterInd + 1 == COLORSSCORE)
		return m_pWheel->m_vColors[0];
	return m_pWheel->m_vColors[m_nColorTowardCenterInd + 1];
}
int Position::previous_color()
{
	if (m_nColorTowardCenterInd == 0)
		return m_pWheel->m_vColors[COLORSSCORE - 1];
	return m_pWheel->m_vColors[m_nColorTowardCenterInd - 1];
}

class Board
{
public:
	Board(const Wheel & wh1, const Wheel & wh2, const Wheel & wh3, const Wheel & wh4,
		const Wheel & wh5, const Wheel & wh6, const Wheel & wh7)
		: m_vWheels{ wh1,wh2,wh3,wh4,wh5,wh6,wh7 } {}

	vector <Wheel> m_vWheels;
	vector <Position> m_vPositions = { CENTER, NORWES, NOREAS, EAST, SOUEAS, SOUWES, WEST };
	void locate(const int &nLastPosition = 0);
	bool put_and_rotate(const int & nWheel, const int & nPosition);
	bool is_suit(const int &nPosition);
	void show_order();
	int what_touches_black();
};
void Board::locate(const int &nLastPosition)
{
	static bool bIsFinished = false;
	for (int j = 0; j < WHEELSSCORE; ++j)
	{
		if (!m_vWheels[j].m_bIsBusy)
		{
			if (put_and_rotate(j, nLastPosition))
			{
				if (nLastPosition == WEST)
				{
					bIsFinished = true;
					return;
				}
				m_vWheels[j].m_bIsBusy = true;
				locate(nLastPosition + 1);
				if (bIsFinished) return;
				m_vWheels[j].m_bIsBusy = false;
			}
		}
	}
}
bool Board::put_and_rotate(const int & nWheel, const int & nPosition)
{
	m_vPositions[nPosition].m_pWheel = &m_vWheels[nWheel];
	if (nPosition == CENTER) return true;

	const int nColorFromCenter = nPosition - 1;
	for (int i = 0; i < COLORSSCORE; ++i)
	{
		if (m_vPositions[CENTER].m_pWheel->m_vColors[nColorFromCenter] == m_vPositions[nPosition].m_pWheel->m_vColors[i])
		{
			m_vPositions[nPosition].m_nColorTowardCenterInd = i;
			return is_suit(nPosition);
		}
	}
	return 0;//if something goes wrong
}
bool Board::is_suit(const int &nPosition)
{
	int nPrevPosition = nPosition - 1;
	if (nPosition <= NORWES)
		return true;
	else if (nPosition < WEST)
		return (m_vPositions[nPrevPosition].previous_color() == m_vPositions[nPosition].next_color());
	else //if (nPosition == WEST)
		return ((m_vPositions[nPrevPosition].previous_color() == m_vPositions[nPosition].next_color())
			&& (m_vPositions[nPosition].previous_color() == m_vPositions[NORWES].next_color()));
}
void Board::show_order()
{
	for (int i = 0; i < POSITIONSSCORE; ++i)
		cout << m_vPositions[i].m_pWheel->m_nWheelInd << ' ';
	cout << endl;
}
int Board::what_touches_black()
{
	int nNumberOfBlack = 0;
	for (int i = 0; i < COLORSSCORE; ++i)
		if (m_vPositions[CENTER].m_pWheel->m_vColors[i] == BLACK)
			nNumberOfBlack = i;
	return m_vPositions[nNumberOfBlack + 1].m_pWheel->m_nWheelInd;
}

int main()
{
	Wheel wWheel1(BLACK, RED, WHITE, BLUE, YELLOW, GREEN, 1);
	Wheel wWheel2(YELLOW, BLUE, RED, BLACK, WHITE, GREEN, 2);
	Wheel wWheel3(RED, WHITE, GREEN, BLACK, BLUE, YELLOW, 3);
	Wheel wWheel4(GREEN, BLUE, YELLOW, RED, WHITE, BLACK, 4);
	Wheel wWheel5(GREEN, RED, WHITE, BLUE, BLACK, YELLOW, 5);
	Wheel wWheel6(RED, GREEN, YELLOW, BLACK, BLUE, WHITE, 6);
	Wheel wWheel7(YELLOW, WHITE, BLUE, GREEN, RED, BLACK, 7);
	Board bBoard(wWheel1, wWheel2, wWheel3, wWheel4, wWheel5, wWheel6, wWheel7);
	bBoard.locate();
	cout << "The wheel that placed in the center is: " << bBoard.m_vPositions[CENTER].m_pWheel->m_nWheelInd << endl
		<< "This is the order from the center to the last wheel:\n";
	bBoard.show_order();
	cout << "This wheel touches center wheel's black color: " 
		<< bBoard.what_touches_black() << endl;
	
	return 0;
}
