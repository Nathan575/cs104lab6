#include <iostream>
#include <cstdlib>

using namespace std;


int main(int argc, char *argv[]) {
    const string EXIT = "quit";
    string command;
    do {
	cout << "calc: ";
        cin >> command;

        if ("help" == command)
        {
            // to do
	    cout << "help documentation" << endl;
        }
        else
        {
           // to do for start
	   cout << "unknown command" << endl;
	   return 1;
        }
    } while (EXIT != command);
    return 0;
}
