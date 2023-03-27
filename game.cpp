#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>
#include <time.h>

using namespace std;

void displayMenu() {
	cout << "Welcome to Tic-Tac-Toe Game " << endl << endl;
	cout << "Player is 'x'" << endl;
	cout << "Computer is 'o'" << endl;    
	cout << "To play the game, please enter a number between 1-9 to input your 'x' mark onto the board" << endl << endl;
}

void displayBoard(string board[3][3], int n) {
	for(int i=0; i<n; i++) {
		if(i == 1 || i == 2) {
			cout << "------|------|------" << endl;
		}

		for(int j=0; j<n; j++) {
			cout << board[i][j] << "\t";
		}
		cout << endl;
	}
	cout << endl;
}

string playerMove(string board[3][3], unordered_map<int,pair<int,int>> move) {
	bool retry = true;
	int playerMove;

	while(retry == true) {
		cout << "Enter your move (1-9): ";
		cin >> playerMove;
		cout << endl;

		if(playerMove >= 1 && playerMove <= 9) {
			int i=move[playerMove].first;
			int j=move[playerMove].second;

			if(board[i][j] == "") {
				board[i][j] = 'x';
				retry = false;
			} else {
				cout << "Invalid move: This cell is taken" << endl;
				cout << "Please make a move in an empty cell" << endl << endl;
			}
		} else {
			cout << "Invalid move: Input a number between 1 - 9" << endl << endl;
		}
	}

	return "x";
}

string beginnerCompMove(string board[3][3], unordered_map<int,pair<int,int>> move) {
	bool retry = true;
	int compMove;
    srand(time(0));

	while(retry == true) {
		compMove = rand()%9+1;

		int i=move[compMove].first;
		int j=move[compMove].second;

		if(board[i][j] == "") {
			board[i][j] = 'o';
			retry = false;
		}
	}

	return "o";
}

void displayResults(string board[3][3], int n, int winner) {
	// Display board
	displayBoard(board, n);  

	// Display winner
	if(winner == 1) {
	    cout << "Player Wins!" << endl; 
	} else if(winner == 2) {
	    cout << "Computer Wins!" << endl; 
	} else if(winner == 3) {
	    cout << "It's a Draw!" << endl; 
	}
}

int decideWinner(string board[3][3], int n, string lastMove) {
	int winner = 0;

	bool d1 = board[0][0] == lastMove && board[1][1] == lastMove && board[2][2] == lastMove;
	bool d2 = board[0][2] == lastMove && board[1][1] == lastMove && board[2][0] == lastMove;
	bool end = board[0][0] != "" && board[0][1] != "" && board[0][2] != "" && board[1][0] != "" && board[1][1] != "" && board[1][2] != "" && board[2][0] != "" && board[2][1] != "" && board[2][2] != "";
	
	if(d1 || d2) {
		if(lastMove == "x") winner = 1;
		else if(lastMove == "o") winner = 2;
	} else {
		for(int i=0; i<n; i++) {
			bool rows = board[i][0] == lastMove && board[i][1] == lastMove && board[i][2] == lastMove;
			bool cols = board[0][i] == lastMove && board[1][i] == lastMove && board[2][i] == lastMove;
			
			if(rows || cols) {
				if(lastMove == "x") winner = 1;
				else if(lastMove == "o") winner = 2;
				break;			
			}
		}
	}

	if(end && winner == 0) {
		winner = 3;	
	} 

	return winner;
}


int mapScores(int winner) {
	if(winner == 1) return -1;
	else if(winner == 2) return 1;
	else return 0;
}

int minimax(string board[3][3], int depth, int n, int alpha, int beta, bool maximisingPlayer) {
	int winner;
	if(maximisingPlayer) winner = decideWinner(board,n,"x");
	else winner = decideWinner(board,n,"o");

	if(winner != 0) {
		return mapScores(winner);
	}

	if(maximisingPlayer) {
		int maxScore = INT_MIN;

		for(int i=0; i<n; i++) {
			for(int j=0; j<n; j++) {
				if(board[i][j] == "") {
					board[i][j] = "o";
					int score = minimax(board,depth+1,n,alpha,beta,false);
					board[i][j] = "";
					maxScore = max(score,maxScore);
					alpha = max(score,alpha);
					if(beta <= alpha) break;
				}
			}
		}

		return maxScore;
	} else {
		int minScore = INT_MAX;

		for(int i=0; i<n; i++) {
			for(int j=0; j<n; j++) {
				if(board[i][j] == "") {
					board[i][j] = "x";
					int score = minimax(board,depth+1,n,alpha,beta,true);
					board[i][j] = "";
					minScore = min(score,minScore);
					beta = min(score,beta);
					if(beta <= alpha) break;
				}
			}
		}

		return minScore;
	}
} 

string amateurCompMove(string board[3][3], int n) {
	int maxScore = INT_MIN;
	pair<int,int> compBestMove;

	for(int i=0; i<n; i++) {
		for(int j=0; j<n; j++) {
			if(board[i][j] == "") {
				board[i][j] = "o";
				int score = minimax(board,0,n,INT_MIN,INT_MAX,false);
				board[i][j] = "";

				if(score > maxScore) {
					maxScore = score;
					compBestMove = {i,j};
				}
			}
		}
	}

	int i = compBestMove.first;
	int j = compBestMove.second;
	board[i][j] = "o";

	return "o";
}

unordered_map<int,pair<int,int>> movesTable(int n) {
	int cell = 0;
	unordered_map<int,pair<int,int>> movesMap;

	for(int i=0; i<n; i++) {
		for(int j=0; j<n; j++) {
			cell++;
			movesMap[cell] = {i,j};
		}
	}

	return movesMap;
}

int main() {
	// Initalise board
	int n = 3;
	string board[3][3] = {{"","",""},{"","",""},{"","",""}};

	// Moves map
	unordered_map<int,pair<int,int>> move = movesTable(n);

	// Display menu
	displayMenu();

	int winner = 0;

	while(winner == 0) {
		// Display board
		displayBoard(board, n);

		// Player move
		string player = playerMove(board,move);

		// Decide winner
		winner = decideWinner(board,n,player);

		if(winner == 0) {
			// Computer move
			// string comp = beginnerCompMove(board,move);
			string comp = amateurCompMove(board,n);

			// Decide winner
			winner = decideWinner(board,n,comp);
		}

		// Display results
		if(winner != 0) displayResults(board,n,winner);
	}
}
