#include <iostream>
#include <vector>
#include <string>

#include "somedefs.h"

using namespace std;

int main()
{
    vector<string> msg {"Hello", "C++", "World", "from", "VS Code", "and the C++ extension!"};

    for (const string& word : msg)
    {
        cout << word << " ";
    }
    printf("What a %d!!!\n", KUKU);
    cout << endl;
}