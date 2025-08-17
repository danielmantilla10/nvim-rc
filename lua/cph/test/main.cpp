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
	if (string (argv [1]) == "-res"){
		cout << "Inputs:\n" ;
		system ("rm ~/.config/nvim/lua/cph/test/input/* ~/.config/nvim/lua/cph/test/output/* > ~/.config/nvim/lua/cph/test/null 2>&1") ;
		system ("rm ~/.config/nvim/lua/cph/test/null") ;
		bool ret = 0 ;
		do {
			ret = (system ("~/.config/nvim/lua/cph/test/./in 0") == 129) ;
		} while (ret) ;
		cout << "Outputs:\n" ;
		do {
			ret = system ("~/.config/nvim/lua/cph/test/./out 0") == 129 ;
		} while (ret) ;
	}
	else {
		int ret = 0 ;
		string cmd = "~/.config/nvim/lua/cph/test/./in $(ls ~/.config/nvim/lua/cph/test/input -1A | wc -l)" ;
		cout << "Inputs:\n" ;
		do {
			ret = system (cmd.c_str ()) == 129 ;
		} while (ret) ;
		cout << "Outputs:\n" ;
		cmd = "~/.config/nvim/lua/cph/test/./out $(ls ~/.config/nvim/lua/cph/test/output -1A | wc -l)" ;
		do {
			ret = system (cmd.c_str ()) == 129 ;
		} while (ret) ;
	}
	return 0 ;
}

