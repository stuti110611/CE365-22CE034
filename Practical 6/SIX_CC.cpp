#include <iostream>
#include <string>

using namespace std;

class RecursiveDescentParser {
private:
    string input;
    int index;

    // Function to match a specific character
    bool match(char expected) {
        if (index < input.length() && input[index] == expected) {
            index++;
            return true;
        }
        return false;
    }

    // Recursive parsing functions
    bool S();
    bool L();
    bool L_prime();

public:
    RecursiveDescentParser(string str) : input(str), index(0) {}

    bool parse() {
        if (S() && index == input.length()) { // Ensure entire string is consumed
            return true;
        }
        return false;
    }
};

// S → ( L ) | a
bool RecursiveDescentParser::S() {
    int backtrack = index;

    if (match('a')) {
        return true;
    }

    index = backtrack; // Restore position
    if (match('(') && L() && match(')')) {
        return true;
    }

    return false;
}

// L → S L’
bool RecursiveDescentParser::L() {
    int backtrack = index;

    if (S() && L_prime()) {
        return true;
    }

    index = backtrack;
    return false;
}

// L’ → , S L’ | ϵ
bool RecursiveDescentParser::L_prime() {
    int backtrack = index;

    if (match(',')) {
        if (S() && L_prime()) {
            return true;
        }
        index = backtrack; // Restore position on failure
        return false;
    }

    // Epsilon case (ϵ) is always valid
    return true;
}

int main() {
    string input;
    cout << "Enter a string: ";
    cin >> input;

    RecursiveDescentParser parser(input);
    if (parser.parse()) {
        cout << "Valid string" << endl;
    } else {
        cout << "Invalid string" << endl;
    }

    return 0;
}
