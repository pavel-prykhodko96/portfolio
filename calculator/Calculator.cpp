#include <iostream>
#include <string>
#include <vector>
using namespace std;

const char quit = 'q';
const char print = ';';
const char number = '8';
const char name = 'a';
const char let = 'L';
const char sqr = 'S'; //SQRT FUNCTION
const char pw = 'P'; //POW FUNCTION
const char declkey1 = '#';
const char help = 'H';
const string prompt = "> ";
const string declkey = "let";
const string result = "= "; //We understand that we see result after this
const string sqrtkey = "sqrt";
const string powkey = "pow";
const string exitkey = "exit";

void guide();
double declaration();
void clean_up_mess();
void calculate();
double primary();
double term();
double expression();
double statement();

class Token
{
public:
	char kind;
	double value;
	string name;
	Token(char ch) :kind{ ch } {};
	Token(char ch, double val) :kind{ ch }, value{ val }{};
	Token(char ch, string n) :kind{ ch }, name{ n }{};
};
class Token_stream //Stream to getting symbols
{
public:
	Token_stream() :full(0), buffer(0) { }
	Token get();
	void putback(Token t);
	void ignore(char c);
private:
	bool full{ false };
	Token buffer;
};
Token_stream ts; //Variable to work with symbols and call .get .putback .ignore
void Token_stream::putback(Token t) //Function to write save symbol in the buffer
{
	buffer = t;
	full = true;
}
Token Token_stream::get() //Reading the symbols from the stream and 
{                         //decide to calculate or crating the variable
	if (full)
	{
		full = false;
		return buffer;
	}
	char ch;
	while (cin.get(ch) && (isspace(ch)))
	{
		if (ch == '\n') return Token{ print };
	}
	cin.putback(ch);
	cin >> ch;
	switch (ch)
	{
	case help:
	case quit:
	case print:
	case '(':
	case ')':
	case '+':
	case '-':
	case '*':
	case '/':
	case '%':
	case '=':
	case ',':
		return Token{ ch }; // Return operation
	case '.':
	case '0': case '1': case '2': case '3': case '4':
	case '5': case '6': case '7': case '8': case '9':
	{
		cin.putback(ch);
		double val;
		cin >> val;
		return Token{ number, val }; // Return value
	}
	case declkey1:	
		return Token{ let }; //Starting initialization of variable
	default:
		if (isalpha(ch)) // Reading names of functions, operations, names of variables 
		{
			string s;
			s += ch;
			while (cin.get(ch) && (isalpha(ch) || isdigit(ch) || ch == '_')) s += ch; // Letters, digits and '_'
			cin.putback(ch);
			if (s == sqrtkey) // run sqrt func
				return Token{ sqr };
			if (s == powkey) // run pow func
				return Token{ pw };
			if (s == declkey) 
				return Token{ let };
			if (s == exitkey) // quit programm
				return Token{ quit };
			return Token(name, s); // else getting the name and value to the variable
		}
		throw runtime_error("Incorrect token");
	}
}
void Token_stream::ignore(char c) //Skip all symbols until 'print' or another 'c'
{
	if (full && c == buffer.kind)
	{
		full = false;
		return;
	}
	full = false;
	char ch = 0;
	while (cin.get(ch))
		if ((isspace(ch) && ch == '\n') || ch==c) return;
}
class Variable
{
public:
	string name;
	double value;
	Variable(string n, double v) :name(n), value(v) { }
	bool if_const(string n)
	{
		if (n == "pi" || n == "e")return 1;
		return 0;
	}
};
vector <Variable> var_table;
class Symbol_table
{
public:
	double get_assig_value(string s) //Find needed value of variable in the var_table
	{
		Token t = ts.get();
		if (t.kind == '=') set_value(s, expression()); //To assignment the already created variable.
		else ts.putback(t);
		for (const Variable& v : var_table)
		{
			if (v.name == s)
			{
				return v.value;
			}
		}
		throw runtime_error("get: undifined identifier ");
	}
	void set_value(string s, double d) //Reinitialization of variable, 
	{                                  //not used in the code yet
		for (Variable& v : var_table)
		{
			if (v.if_const(s)) throw runtime_error("Can't to declare const variable");
			if (v.name == s)
			{
				v.value = d;
				return;
			}
		}
		throw runtime_error("set: undifined identifier ");
	}
	bool is_declared(string var) //Checking is the name initialized or not
	{
		for (const Variable& v : var_table)
			if (v.name == var) return true;
		return false;
	}
	double define_name(string var, double val) //Write the variable
	{
		if (is_declared(var)) throw runtime_error("repeated declaration of variable");
		var_table.push_back(Variable(var, val));
		return val;
	}
};


int main()
{
	cout << "For guide write 'H'\n";
	Symbol_table S;
	S.define_name("e", 2.7182818284);
	S.define_name("pi", 3.1415926535); 
	calculate();
	return 0;
}


double declaration() //Checking the right of the decleration of variable
{                    //according to sample: "let abc = 5-(31*9)/9;"
	Token t = ts.get();
	if (t.kind != name)
		throw runtime_error(" no name of variable");
	string var_name = t.name;
	Token t2 = ts.get();
	if (t2.kind != '=')
		throw runtime_error("'=' missing in declaration");
	double d = expression();
	Symbol_table S;
	S.define_name(var_name, d); //If it accords, creating new variable in the var_table
	return d;
}
void clean_up_mess() //Do not to close the window if error and continue after print;
{
	ts.ignore(print);
}
void calculate() //Starting the prompt and finding the end
{                //of desired action to complete
	while (cin)
	try
	{
		cout << prompt;
		Token t = ts.get();
		while (t.kind == print) t = ts.get(); //Skips extra ';' or '\n'
		if (t.kind == quit) return;//quit the programm            
		if (t.kind == help)
		{
			guide();
			continue;
		}
		ts.putback(t);
		cout << result << statement() << endl;
	}
	catch (exception& e)
	{
		cerr << e.what() << '\n';
		clean_up_mess();
	}
	catch (...)
	{
		cerr << "unknown error!\n";
	}
}
double primary() //returns values and names of variables
{
	Token t = ts.get();
	Symbol_table S;
	switch (t.kind)
	{
	case '(':
	{
		double d = expression();
		t = ts.get();
		if (t.kind != ')')
		{
			throw runtime_error("')' is missed!");
		}
		return d;
	}
	case sqr:
	{
		double d = expression();
		if (d < 0) throw runtime_error("Value can't be lower then 0 for sqrt func!");
		return sqrt(d);
	}
	case pw:
	{
		t = ts.get();
		if (t.kind != '(') throw runtime_error("'(' is missed!");
		double x = expression();
		t = ts.get();
		if (t.kind != ',') throw runtime_error("',' is missed!");
		int i = (int)expression(); //Cheking is the value integer or not
		t = ts.get();
		if (t.kind != ')') throw runtime_error("')' is missed!");
		return pow(x, i);
	}
	case number:
		return t.value;
	case '-':
		return -primary();
	case '+':
		return primary();
	case name:
		return S.get_assig_value(t.name);
	default:
		throw runtime_error("primary is missed");
	}
}
double term()
{
	double left = primary();
	Token t = ts.get();
	while (true)
	{
		double d(0);
		switch (t.kind)
		{
		case '*':
			left *= primary();
			t = ts.get();
			break;
		case '/':
			d = primary();
			if (d == 0)
			{
				throw runtime_error("Dividing on zero");
			}
			left /= d;
			t = ts.get();;
			break;
		case '%':
		{
			int i1 = (int)left; //Checking is the value integer or not
			int i2 = (int)primary();
			if (i2 == 0) throw runtime_error("%: division at zero");
			left = i1 % i2;
			t = ts.get();
			break;
		}
		default:
			ts.putback(t);
			return left;
		}
	}
}
double expression()
{
	double left = term();
	Token t = ts.get();
	while (true)
	{
		switch (t.kind)
		{
		case '+':
			left += term();
			t = ts.get();
			break;
		case '-':
			left -= term();
			t = ts.get();
			break;
		default:
			ts.putback(t);
			return left;
		}
	}
}
double statement() //Just decide to write the variable
{                  //Or to start the calculate process
	Token t = ts.get();
	switch (t.kind)
	{
	case let:
		return declaration();
	default:
		ts.putback(t);
		return expression();
	}
}
void guide()
{
	cout << "This is calculator. You can call this operations:\n"
		<< "+, -, *, /, %, you can use '(' and ')'\n"
		<< "You can call pow(x,i) and sqrt(x), consts 'e' and 'pi'\n"
		<< "You can declare variables by 'let x = expression' or '#' instead of 'let'\n"
		<< "And call this variables or redefine after but not redeclare\n"
		<< "To redefine write 'x = expression'\n"
		<< "To start operations press ';', to exit write 'exit'\n"
		<< "If prompt '> ' didn't appear write ';'\n";
}