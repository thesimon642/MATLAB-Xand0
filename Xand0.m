classdef Xand0
    
    
    properties
        board %this property holds the values of each square in the board
    end
    
    methods
        function a = Xand0
            a.board = '         ';%initialise by setting each square to a space representing blank
        end
        
        
        function disp(a)%display each square on the board with a border
            disp([ '+-------+' ; ...
                '| ' a.board(1) ' ' a.board(2) ' ' a.board(3) ' |' ; ...
                '| ' a.board(4) ' ' a.board(5) ' ' a.board(6) ' |' ; ...
                '| ' a.board(7) ' ' a.board(8) ' ' a.board(9) ' |' ; ...
                '+-------+' ]);
        end
        
        function out = legalMoves(a)
            out = strfind(a.board,' ');%output all legal moves by outputting where there is a space in board
        end
        
        function a = move(a,Move_choice)
            disp(strfind(legalMoves(a),Move_choice))
            disp(strfind(legalMoves(a),Move_choice) == zeros(0))
            if  isequal(strfind(legalMoves(a),Move_choice),[]) == false %player moves, if move legal then make it by changing square to X
                a.board(Move_choice)='X';
            else
                disp('illegal move') %if illegal move made then no move is made, player can make another
            end
            wins(a,'P') %check to see if player has now won
        end
        function a = computermove(a)
            Possible_moves = legalMoves(a);
            Chosen_moves = Possible_moves(randsample(length(Possible_moves),1));%computer takes random move from legal moves
            a.board(Chosen_moves)='0';
            wins(a,'O') %check to see if computer won
        end
        function wins(a,player) %function to check if a win ha occured, p tells which player just moved so won (if anyone won)
            Player_has_Won = false;
            for i =0:3:6
                if isequal(a.board(1+i),a.board(2+i),a.board(3+i)) && ' '~=a.board(1+i)%checks rows
                    Player_has_Won = true;
                end
                if isequal(a.board(1+i/3),a.board(4+i/3),a.board(7+i/3)) && ' '~=a.board(1+i/3)%checks collumns
                    Player_has_Won = true;
                end
                
                if a.board(1)==a.board(5) && a.board(9)==a.board(1)&& ' '~=a.board(1)%checks diagonals
                    Player_has_Won = true;
                end
                if a.board(3)==a.board(5) && a.board(7)==a.board(3)&& ' '~=a.board(3)
                    Player_has_Won = true;
                end
                if Player_has_Won %if somone has one display who
                    if player=='P'
                        disp('player wins')
                        return
                    else
                        disp('computer wins')
                        return
                    end
                end
            end
        end
    end
end