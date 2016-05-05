
// Compile using:
//  flex -o cpptok.cc cpptok.lex 
//  g++ -o cpptok cpptok.cc -lfl

%{
#define NUMBER     256
#define IDENTIFIER 257

#include <fstream>
#include <iostream>
#include <sstream>
#include <utility>
#include <string>
#include <map>
#include <iterator>
#include <vector>
#include <algorithm>
#include <cstdlib>
#include <cstdio>

using namespace std;

typedef map<string, int>::iterator dict_iter;
map<string, int> dict;

void
addtodict(char *yytext) {
  string key(yytext);
  dict_iter find_key; 
  dict[key] = 1;
}

%}

/* regexp definitions */
num [0-9]+

%%

{num}           { return NUMBER; }
[a-zA-Z0-9]+    { return IDENTIFIER; }
.		{ return -1; }

%%

int
main () {
  int token;
  while ((token = yylex())) {
    switch (token) {
      case NUMBER: printf("NUMBER: %s, LENGTH:%d\n", yytext, (int)yyleng); addtodict(yytext); break;
      case IDENTIFIER: printf("IDENTIFIER: %s, LENGTH:%d\n", yytext, (int)yyleng); addtodict(yytext); break;
      default: printf("Error: %s not recognized\n", yytext);
    }
  }
  for (dict_iter i = dict.begin(); i != dict.end(); i++) {
    cout << i->first << endl;
  }
  return 1;
}

