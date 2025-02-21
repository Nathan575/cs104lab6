#include <iostream>
#include <cstdlib>
#include "mathfuncs.h"  // Include the math functions

using namespace std;

void show_help() {
    cout << "Swiss Army Calculator Commands:\n";
    cout << "  help                - Show this help message\n";
    cout << "  subtract <a> <b>    - Subtracts b from a\n";
    cout << "  multiply <a> <b>    - Multiplies a and b\n";
    cout << "  divide <a> <b>      - Divides a by b (b must not be 0)\n";
    cout << "  quit                - Exit the calculator\n";
}

int main() {
    const string EXIT = "quit";
    string command;
    double a, b;

    do {
        cout << "calc: ";
        cin >> command;

        if (command == "help") {
            show_help();
        }
        else if (command == "subtract") {
            cin >> a >> b;
            cout << "Result: " << subtract(a, b) << endl;
        }
        else if (command == "multiply") {
            cin >> a >> b;
            cout << "Result: " << multiply(a, b) << endl;
        }
        else if (command == "divide") {
            cin >> a >> b;
            if (b == 0) {
                cout << "Error: Division by zero is not allowed." << endl;
            } else {
                cout << "Result: " << divide(a, b) << endl;
            }
        }
        else if (command == EXIT) {
            cout << "Exiting calculator. Goodbye!" << endl;
        }
        else {
            cout << "Unknown command. Type 'help' for available commands." << endl;
        }
    } while (command != EXIT);

    return 0;
}
