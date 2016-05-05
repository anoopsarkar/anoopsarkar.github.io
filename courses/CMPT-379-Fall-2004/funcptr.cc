
// compile with: g++ funcptr.cc -o functpr

#include <deque>
#include <iostream>

using namespace std;

void a (int i) {
  cout << "a: " << i << endl;
  return;
}

void b (int i) {
  cout << "b: " << i << endl;
  return;
}

int main(int argc, char **argv)
{
  deque< void (*) (int ) > functbl;
  deque< void (*) (int ) >::iterator func_iter;
  functbl.push_back(a);
  functbl.push_back(b);
  int i = 1;
  for (func_iter = functbl.begin(); func_iter != functbl.end(); func_iter++)
     (*func_iter)(i++); 
}
