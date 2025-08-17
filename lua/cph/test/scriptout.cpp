#include <bits/stdc++.h>
#pragma GCC optimize ("Ofast")
#define p_b push_back
#define F first
#define S second
#define ll long long
#define int long long
using namespace std ;

int32_t main (int32_t argc , char* argv []){
	//ios_base::sync_with_stdio (0) ; cin.tie (0) ; cout.tie (0) ;
	string s , ans = "" ;
	char contador = *argv [1] + 1 ;
	int contador2 = 0 ;
	while (getline (cin , s)){
		//if (ans.empty () && s == "--" || s == "-"){
		//	cout << "Please, introduce a valid input (at least 1 line)\n" ;
		//}
		if (s.size () == 0){
			continue ;
		}
		if (s == "!"){
			ans.clear () ;
		}
		if (s != "-" && s != "--"){
			ans += s + '\n' ;
		}
		else if (s.size () > 0 && s [0] == '-'){
			ans.pop_back () ;
			//string cmd = "touch " + contador ;
			//cmd += ".out" ;
			//system (cmd.c_str ()) ;
			string comando = "echo '" + ans + "' > ~/.config/nvim/lua/cph/test/output/" + contador + "." + contador + ".1.out" ;
			system (comando.c_str ()) ;
			ans = "" ;
			contador++ ;
			if (s.size () > 1 && s [1] == '-') {
				return 0 ;
			}
		}
		if (contador > '9')
			return 0 ;	
	}
	return 0 ;
}

