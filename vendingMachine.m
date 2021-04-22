%This function simulates a vending machine in the australian currency
%Made by: Guilherme Elias
function vendingMachine()

clear all
clc

%Declaring arrays with stock pieces
stock = [25 25 25 25 25 25];
price = [2.5 2.3 2.25 2.4 2.7 2];

%This variable counts how many bills and coins there are for each value
billsAndCoins = [20 20 20 20 20 20 20 20 20 20 20];

%Variable to make the infinite loop
i = 0;

%Infinite loop to keep the machine always running
while i == 0
    %This validades if a drink is real or not (taken as true)
    validDrink = 1;
    
    %Starting counting the money everytime an operation ends
    insertedMoney = 0;
    
    %Starts the change variable from 0
    changeTemp = 0;
    
    %Variable to check if the coins and bills are available for change
    coinCheck = 1;
    
    %This variable will tell the program if the change is possible or not
    impossibleChange = 0;
    
    %Menu with Options
    fprintf('Welcome to the soft drink vending machine\n');
    fprintf('1 - Coca-Cola    Price: $2.50 - Available in stock: %d\n', stock(1));
    fprintf('2 - Pepsi        Price: $2.30 - Available in stock: %d\n', stock(2));
    fprintf('3 - Orange Fanta Price: $2.25 - Available in stock: %d\n', stock(3));
    fprintf('4 - Sprite       Price: $2.40 - Available in stock: %d\n', stock(4));
    fprintf('5 - Schweppes    Price: $2.70 - Available in stock: %d\n', stock(5));
    fprintf('6 - Iced Tea     Price: $2.00 - Available in stock: %d\n', stock(6));
    
    fprintf('Choose your drink: ');
    
    %Reads the user's drink option
    optionUser = input('');
    
    %See if the chosen option is out of range
    if optionUser < 1 || optionUser > 6
        validDrink = 0;
        fprintf('\nInvalid Option, type a number between 1 and 6\n\n');
        
        %If it is in range
    else
        
        %If the drink is out of stock
        if stock(optionUser) == 0
            validDrink = 0;
            fprintf('\nOut of stock! \suck my cock\n\n');
            stock(optionUser) = stock(optionUser) - 0;
            
            %If the drink is in stock and it is a valid option
        else
            
            %This loop will receive the money from the user
            while insertedMoney < price(optionUser)
                fprintf('Insert valid bill or coin: ');
                cashInserted = input('');
                
                %These if statements will count the valid bills or coins and
                %add them up to count as the drink price, there is one for
                %each value that exists in Australia. It will also add one
                %bill or coin for the machine's available change
                if cashInserted == 0.05
                    insertedMoney = insertedMoney + 0.05;
                    billsAndCoins(1) = billsAndCoins(1) + 1;
                    
                elseif cashInserted == 0.10
                    insertedMoney = insertedMoney + 0.1;
                    billsAndCoins(2) = billsAndCoins(2) + 1;
                    
                elseif cashInserted == 0.20
                    insertedMoney = insertedMoney + 0.20;
                    billsAndCoins(3) = billsAndCoins(3) + 1;
                    
                elseif cashInserted == 0.50
                    insertedMoney = insertedMoney + 0.50;
                    billsAndCoins(4) = billsAndCoins(4) + 1;
                    
                elseif cashInserted == 1
                    insertedMoney = insertedMoney + 1;
                    billsAndCoins(5) = billsAndCoins(5) + 1;
                    
                elseif cashInserted == 2
                    insertedMoney = insertedMoney + 2;
                    billsAndCoins(6) = billsAndCoins(6) + 1;
                    
                elseif cashInserted == 5
                    insertedMoney = insertedMoney + 5;
                    billsAndCoins(7) = billsAndCoins(7) + 1;
                    
                elseif cashInserted == 10
                    insertedMoney = insertedMoney + 10;
                    billsAndCoins(8) = billsAndCoins(8) + 1;
                    
                elseif cashInserted == 20
                    insertedMoney = insertedMoney + 20;
                    billsAndCoins(9) = billsAndCoins(9) + 1;
                    
                elseif cashInserted == 50
                    insertedMoney = insertedMoney + 50;
                    billsAndCoins(10) = billsAndCoins(10) + 1;
                    
                elseif cashInserted == 100
                    insertedMoney = insertedMoney + 100;
                    billsAndCoins(11) = billsAndCoins(11) + 1;
                    
                else
                    fprintf('\nBill not existent, please insert a valid one\n');
                    insertedMoney = insertedMoney + 0;
                end
                
                if insertedMoney < price(optionUser)
                    fprintf('\nYou inserted: %.2f, you still need to insert at least: %.2f\n\n', insertedMoney, price(optionUser) - insertedMoney);
                end
                
            end
            
            %This will start the variable for the change, it is the
            %inserted money - the price of the chosen soft drink
            change = insertedMoney - price(optionUser);
            
            %This is a temporary variable to count the change and then
            %check if it is possible later
            changeTemp = change;
            
            
            %This loop will verify if change is needed or not and also
            %start giving the change for the user
            %This loop will check if the coins are available for change
            %running through the array
            for coinCheck = 1:length(billsAndCoins)
                
                %This if statement will check if the value of the coins are
                %available
                if billsAndCoins(coinCheck)<=0
                    impossibleChange = 1;
                end
                
            end
            
            %If the change is possible
            if impossibleChange == 1
                fprintf('\nInsufficient change. Here is your money back: %.2f\n', insertedMoney);
                
            else
                
                while changeTemp >= 0
                    
                    %These if statements will check what bills are necessary
                    %for the change and give it back to the user.
                    %There is no change greater than 100, so the change >= 100
                    %if statement is unnecessary
                    if changeTemp >= 50
                        changeTemp = changeTemp - 50;
                        billsAndCoins(10) = billsAndCoins(10) - 1;
                        
                    elseif changeTemp >= 20
                        changeTemp = changeTemp - 20;
                        billsAndCoins(9) = billsAndCoins(9) - 1;
                        
                    elseif changeTemp >= 10
                        changeTemp = changeTemp - 10;
                        billsAndCoins(8) = billsAndCoins(8) - 1;
                        
                    elseif changeTemp >= 5
                        changeTemp = changeTemp - 5;
                        billsAndCoins(7) = billsAndCoins(7) - 1;
                        
                    elseif changeTemp >= 2
                        changeTemp = changeTemp - 2;
                        billsAndCoins(6) = billsAndCoins(6) - 1;
                        
                    elseif changeTemp >= 1
                        changeTemp = changeTemp - 1;
                        billsAndCoins(5) = billsAndCoins(5) - 1;
                        
                    elseif changeTemp >= 0.5
                        changeTemp = changeTemp - 0.5;
                        billsAndCoins(4) = billsAndCoins(4) - 1;
                        
                    elseif changeTemp >= 0.2
                        changeTemp = changeTemp - 0.2;
                        billsAndCoins(3) = billsAndCoins(3) - 1;
                        
                    elseif changeTemp >= 0.1
                        changeTemp = changeTemp - 0.1;
                        billsAndCoins(2) = billsAndCoins(2) - 1;
                        
                    elseif changeTemp >= 0.05
                        changeTemp = changeTemp - 0.05;
                        billsAndCoins(1) = billsAndCoins(1) - 1;
                        
                     %If the machine needs to give a 0.05 coin back, the
                     %loop will be stuck into a 0.05 increment that does not
                     %happen, so, when that happens, this break will make
                     %the function get out of the change while loop and will
                     %work fine
                    else
                        break;
                        %changeTemp = changeTemp - 0.05;
                    end
                    %disp(changeTemp); debugging
                end
            end
            
            %This phrase ends the loop of change and gives the drink for
            %the user if the change is possible
            fprintf('\nHere is your drink, your change is: %.2f\n', change);
            
            %This will get one drink out of the stock
            stock(optionUser) = stock(optionUser) - 1;
            fprintf('\n');
        end
    end
end
end