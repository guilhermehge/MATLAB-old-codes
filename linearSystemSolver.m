%This function solves linear systems equations, asks for each parameter,
%one at a time
%Made by: Guilherme Elias
function linearSystemSolver()
    
    clear
    clc;
    equations = input('Type in the number of equations: ');
    first = 'st';
    second = 'nd';
    third = 'rd';
    fourthelse = 'th';
%% Making the matrix for the coefficients given

    %Goes through the rows to make the matrix
    for eq = 1:equations

        %Goes through the columns in the rows
        for var = 1:equations
            
            %Shows the message for the user with the correct number of
            %equation and coefficient
            fprintf('Enter the coefficient %d of equation %d: ', var, eq);
            
            %Stores the value input by the user for the equation matrix a
            a(eq, var) = input('');
        end
%% Organising Results

        %If statement to print st, nd, rd, th, after the number asked
        if eq == 1
            fprintf('Enter the %d%s constant: ', eq, first);
        
        elseif eq == 2
            fprintf('Enter the %d%s constant: ', eq, second);
            
        elseif eq == 3
            fprintf('Enter the %d%s constant: ', eq, third);
            
        else
            fprintf('Enter the %d%s constant: ', eq, fourthelse);
            
        end
        %Stores the constant in the matrix b (column matrix)
        b(eq, 1) = input('');
    end

 %% Printing answers in a cute way   
 
    %Gets the number of rows and columns of matrix a
    [rows, cols] = size(a);

    for i = 1:rows

        %Calculates the value of x
        x = inv(a)*b;
        
        %Prints the roots ordered
        fprintf('\n');
        disp(['x', num2str(i), ' = ', num2str(x(i))]);
    end
end