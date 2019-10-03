#include <iostream>
#include <string>
#include <vector>

using namespace std;

string number_from_0_to_9(const int& number);
string number_from_10_to_19(const int& number);
string number_from_0_to_99(const int& number);
string number_from_0_to_999(const int& number);
string number_to_string(const double& number);

int main()
{
	double number;
	cout << "Number: ";
	cin >> number;
	cout << number_to_string(number);

	cout << "\nPress any character and then press enter to exit: ";
	char ch;
	cin >> ch;
	return 0;	
}

string number_to_string(const double& number)
{
	if (number >= 1000000000)
		return ("one billion dollars");

	string result;
	vector <int> n_exponents = { 0, 0, 0, 0 };	// 10^-2, 10^0, 10^3, 10^6
	vector <string> s_exponents = { "", "", "thousand ", "million " };
	
	n_exponents[0] = round((number - (int)number) / 0.01);	//cents
					
	for (int divider = 1, vec_ind = 1; divider <= 1000000 && vec_ind < 4; divider *= 1000, ++vec_ind)
		n_exponents[vec_ind] = (int(number) / divider) % 1000;

	for (int i = 3; i >= 0; --i)
	{
		if (n_exponents[i] > 0)
		{
			result += number_from_0_to_999(n_exponents[i]);
			result += s_exponents[i];
		}
		if (i == 1)
		{
			if (number > 1)
				result += "dollars ";
			else if (number == 1)
				result += "dollar ";
		}
		else if (i == 0)
		{
			if (n_exponents[0] > 1)
				result += "cents ";
			else if (n_exponents[0] == 1)
				result += "cent ";
		}
	}
	return result;
}
string number_from_0_to_999(const int& number)
{
	string result;

	int hundred = number / 100;
	if (hundred > 0)
		result += number_from_0_to_9(hundred) + "hundred ";

	int from_0_to_99 = number % 100;
	if (from_0_to_99 > 0)
		result += number_from_0_to_99(from_0_to_99);

	return result;
}
string number_from_0_to_99(const int& number)
{
	int ones = number % 10;
	int tens = number / 10;
	if (tens > 1)
	{
		string s;
		switch (tens)
		{
		case 2: s = "twenty";	break;
		case 3: s = "thirty";	break;
		case 4: s = "fourty";	break;
		case 5: s = "fifty";	break;
		case 6: s = "sixty";	break;
		case 7: s = "seventy";	break;
		case 8: s = "eighty";	break;
		case 9: s = "ninety";	break;
		}
		if (ones > 0)
			s += "-" + number_from_0_to_9(ones);
		else
			s += " ";
		return(s);
	}
	else if (tens == 1)
		return (number_from_10_to_19(number));
	else
		return (number_from_0_to_9(ones));
}
string number_from_10_to_19(const int& number)
{
	switch (number)
	{
	case 10: return ("ten ");		case 11: return ("eleven ");	case 12: return ("twelve ");
	case 13: return ("thirteen ");	case 14: return ("fourteen ");	case 15: return ("fifteen ");
	case 16: return ("sixteen ");	case 17: return ("seventeen ");	case 18: return ("eighteen ");
	case 19: return ("nineteen ");
	}
}
string number_from_0_to_9(const int& number)
{
	switch (number)
	{
	case 0: return ("");		case 1: return ("one ");	case 2: return ("two "); 
	case 3: return ("three ");	case 4: return ("four ");	case 5: return ("five "); 
	case 6: return ("six ");	case 7: return ("seven ");	case 8: return ("eight "); 
	case 9: return ("nine ");
	}
}

