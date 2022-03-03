% Main Program: Tic-Tac-Toe Game.

clc; % Clear the command window. 
clear; % Clear the workspace.

% Play again loop.  
playAgain = 0; % Initalise playAgain equals zero to declare the exit and replay sequence.
while playAgain ~= 'N' && playAgain ~= 'n'
    % This script will display the menu of the game with the instructions.  
    fprintf("Welcome to Tic-Tac-Toe Game \n\n");
    fprintf("Player is 'x' \n");
    fprintf("Computer is 'o' \n");
    fprintf("To play the game, please enter a number between 1-9 to input your 'x' mark onto the board \n\n");

    % This script will obtain the blank 3 x 3 matrix. 
    board = [' ', ' ', ' '; ' ', ' ', ' '; ' ', ' ', ' ']; % Create an empty 2D vector (a 3 x 3 matrix).
    [numRows, numCols] = size(board); % Make the number of rows and columns of the matrix equal to size of the board.

    done = 0; % Intitalise done equals to zero to declare the winner.
    % Display the board and the moves as well as ask the computer and user to make a move until done doesn't equal to 0.
    while done ~= 1
        % This script will display the empty board into the command window.  
        % And display the board with both the player's and the computer's move each time a move is made.
        for row = 1:size(board)    
            if row == 2 || row == 3
                fprintf('---|---|---\n'); % Display the horizontal lines at the start of row 2 and row 3. 
            end
            for column = 1:size(board)
                fprintf(' %s', board(row,column)); % Display the board with both the player's and the computer's move.
                if column == 1 || column == 2
                    fprintf(' |'); % Display the vertical lines at the end of column 1 and column 2. 
                end 
            end
            fprintf('\n'); % Skip a line after every row.
        end

        % This script will prompt the user to make a move by asking them to enter a integer between 1-9.
        retry = 0; % Intalise retry equals zero to declare the retry sequence.
        % While retry doesn't equal to one prompt the user to enter a move.
        % And if player equals a certain number between 1-9 and if the board(row,column) is blank.  
        % The 'x' mark would be placed at the position board(row,column).
        while retry ~=1
            playerMove = input('Please enter you move: '); % Prompt the user to make a move.
            if playerMove == 1 && board(1,1) == ' ' 
                board(1,1) = 'x';        
                retry = 1;
            elseif playerMove == 2 && board(1,2) == ' ' 
                board(1,2) = 'x';       
                retry = 1;
            elseif playerMove == 3 && board(1,3) == ' ' 
                board(1,3) = 'x';
                retry = 1;
            elseif playerMove == 4 && board(2,1) == ' ' 
                board(2,1) = 'x';
                retry = 1;
            elseif playerMove == 5 && board(2,2) == ' ' 
                board(2,2) = 'x';    
                retry = 1;
            elseif playerMove == 6 && board(2,3) == ' ' 
                board(2,3) = 'x';
                retry = 1;
            elseif playerMove == 7 && board(3,1) == ' ' 
                board(3,1) = 'x';    
                retry = 1;
            elseif playerMove == 8 && board(3,2) == ' ' 
                board(3,2) = 'x';
                retry = 1;
            elseif playerMove == 9 && board(3,3) == ' ' 
                board(3,3) = 'x';
                retry = 1;
            elseif board(1,1) ~= ' ' && board(1,2) ~= ' ' && board(1,3) ~= ' ' && board(2,1) ~= ' ' && board(2,2) ~= ' ' && board(2,3) ~= ' ' &&  board(3,1) ~= ' ' && board(3,2) ~= ' ' && board(3,3) ~= ' '
                retry = 1; % If the board(row,column) is not blank, retry equals one, and this prompts the user to make a move again.
            elseif playerMove < 1    
                fprintf("Invalid Move: Input a number greater than equal to 1. \n"); % If user inputs a number less than equal to 1, display this message and prompt the user to make the move again.  
            elseif playerMove > 9    
                fprintf("Invalid Move: Input a number less than equal to 9. \n"); % If user inputs a number greater than equal to 9, display this message and prompt the user to make the move again. 
            else    
                fprintf("Invalid Move: This cell / number assigned to the cell has been taken. Please make your move in an empty cell. \n"); % if the user inputs a number that is already taken, display this message and prompt the user to make the move again.
            end
        end
        
        % This script will generate a random integer between 1-9 for the computer's move.
        % While retry doesn't equal to two generate a random integer between 1-9 for the computer's move.
        % And if the board(row,column) is blank.  
        % The 'o' mark would be placed at the position board(row,column).
        while retry ~= 2
            compMove = randi(9); % Generate a random integer between 1-9 for the computer's move.
            if compMove == 1 && board(1,1) == ' ' 
                board(1,1) = 'o';
                retry = 2;
            elseif compMove == 2 && board(1,2) == ' ' 
                board(1,2) = 'o';    
                retry = 2;
            elseif compMove == 3 && board(1,3) == ' ' 
                board(1,3) = 'o';  
                retry = 2;
            elseif compMove == 4 && board(2,1) == ' ' 
                board(2,1) = 'o';
                retry = 2;
            elseif compMove == 5 && board(2,2) == ' ' 
                board(2,2) = 'o';
                retry = 2;
            elseif compMove == 6 && board(2,3) == ' ' 
                board(2,3) = 'o';
                retry = 2;
            elseif compMove == 7 && board(3,1) == ' ' 
                board(3,1) = 'o';
                retry = 2;
            elseif compMove == 8 && board(3,2) == ' ' 
                board(3,2) = 'o';
                retry = 2;
            elseif compMove == 9 && board(3,3) == ' ' 
                board(3,3) = 'o';
                retry = 2;    
            elseif board(1,1) ~= ' ' && board(1,2) ~= ' ' && board(1,3) ~= ' ' && board(2,1) ~= ' ' && board(2,2) ~= ' ' && board(2,3) ~= ' ' &&  board(3,1) ~= ' ' && board(3,2) ~= ' ' && board(3,3) ~= ' '
                retry = 2; % If the board(row,column) is not blank, retry equals two, and this makes the computer to generate a random integer again between 1-9.
            end
        end

        % Clear the command window after evertime both the player and the computer make their move every time.
        % So that the board doesn't print every move of the player and the computer in a different board. 
        clc;  

        % This script will decide the winner.
        winner = 0; % Initalise winner equals zero.
        % When done equals one the while loop will stop and display the winner.
        % If the player makes the 'x' mark three times such that a straight line can be drawn, winner equals one.
        if board(1,1) == 'x' && board(1,2) == 'x' && board(1,3) == 'x' % First Row.
            winner = 1;
            done = 1;
        elseif board(2,1) == 'x' && board(2,2) == 'x' && board(2,3) == 'x' % Second Row.
            winner = 1;
            done = 1;
        elseif board(3,1) == 'x' && board(3,2) == 'x' && board(3,3) == 'x' % Third Row.
            winner = 1;
            done = 1;   
        elseif board(1,1) == 'x' && board(2,1) == 'x' && board(3,1) == 'x' % First Column.
            winner = 1;
            done = 1;
        elseif board(1,2) == 'x' && board(2,2) == 'x' && board(3,2) == 'x' % Second Column.
            winner = 1;
            done = 1;
        elseif board(1,3) == 'x' && board(2,3) == 'x' && board(3,3) == 'x' % third column.
            winner = 1;
            done = 1;
        elseif board(1,3) == 'x' && board(2,2) == 'x' && board(3,1) == 'x' % Top Right to Bpttom Left.
            winner = 1;
            done = 1; 
        elseif board(1,1) == 'x' && board(2,2) == 'x' && board(3,3) == 'x' % Top Left to Bottom Right
            winner = 1;
            done = 1;
        % If the computer makes the 'o' mark three times such that a straight line can be drawn, winner equals two.
        elseif board(1,1) == 'o' && board(1,2) == 'o' && board(1,3) == 'o' % First Row.
            winner = 2;
            done = 1;
        elseif board(2,1) == 'o' && board(2,2) == 'o' && board(2,3) == 'o' % Second Row.
            winner = 2;
            done = 1;
        elseif board(3,1) == 'o' && board(3,2) == 'o' && board(3,3) == 'o' % Third Row.
            winner = 2;
            done = 1;  
        elseif board(1,1) == 'o' && board(2,1) == 'o' && board(3,1) == 'o' % First Column.
            winner = 2;
            done = 1;
        elseif board(1,2) == 'o' && board(2,2) == 'o' && board(3,2) == 'o' % Second Column.
            winner = 2;
            done = 1;
        elseif board(1,3) == 'o' && board(2,3) == 'o' && board(3,3) == 'o' % Third Column.
            winner = 2;
            done = 1;
        elseif board(1,3) == 'o' && board(2,2) == 'o' && board(3,1) == 'o' % Top Right to Bottom Left.
            winner = 2;
            done = 1; 
        elseif board(1,1) == 'o' && board(2,2) == 'o' && board(3,3) == 'o' % Top Left to Bottom Right.
            winner = 2;
            done = 1;
        % If all the cells are filled and no one wins, winner equals three.
        elseif board(1,1) ~= ' ' && board(1,2) ~= ' ' && board(1,3) ~= ' ' && board(2,1) ~= ' ' && board(2,2) ~= ' ' && board(2,3) ~= ' ' &&  board(3,1) ~= ' ' && board(3,2) ~= ' ' && board(3,3) ~= ' '
            winner = 3;
            done = 1;
        end

        % This script will display the winner.
        if winner == 1
            fprintf("Player Wins! \n"); % When winner equals one the player has won, then this message would be displayed.
        elseif winner == 2
            fprintf("Computer Wins! \n"); % When winner equals two the computer has won, then this message would be displayed.
        elseif winner == 3
            fprintf("It's a Draw! \n"); % When winner equals three no one has won, then this message would be displayed.
        end
    end
    
    % Prompt the user to play again.
    % If playAgain equals yes the while loop would be repeated to play the game again.
    % If playAgain equals no the while loop would stop.
    % This is because the while loop repeats until playAgain doesn't equal to N or n and stops when playAgain equals to Y or y.
    playAgain = input("Do you want to play again (y/n) or (Y/N): ", "s");
end