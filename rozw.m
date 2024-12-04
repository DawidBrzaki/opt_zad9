%Zadanie1
function f=zadanie(x)
f(1) = 3*x(1)^2 + 2*x(2)^2 - 30*x(1) - 50*x(2) + 200; 
f(2) = -2*x(1)^2 - 4*x(2)^2 + 10;                   
f(3) = 2*x(1) + 5*x(2) - 50;                         
f(4) = -5*x(1) - 7*x(2) + 20;                        
f(5) = x(1) + 2*x(2) - 10;                          
f(6) = x(1) - 4;                                     
end

% Warunki początkowe
x0 = [1; 1]; % Początkowe wartości 

% Rozwiązanie problemu optymalizacji
[x, fval] = fminimax(@zadanie, x0);

disp('Optymalne rozwiązanie:');
disp(['x(1): ', num2str(x(1))]);
disp(['x(2): ', num2str(x(2))]);

disp(['fval: ', num2str(fval)]);

%Zadanie 2
function f=zadanie(x)
    f(1)= 2*sinc(x(1))
    f(2)= 3*sin(7*x(1)) + 6* cos(8*x(2))
    f(3)= 8*tan(3*x(1))+ tan(2*x(2))
end

% Warunki początkowe
x0 = [1; 1]; % Początkowe wartości 

% Rozwiązanie problemu optymalizacji
[x, fval] = fminimax(@zadanie, x0);

disp('Optymalne rozwiązanie:');
disp(['x(1): ', num2str(x(1))]);
disp(['x(2): ', num2str(x(2))]);

disp(['fval: ', num2str(fval)]);


%Zadanie 3
function f=zadanie(x)
    f(1)= -2*x(1)
    f(2)= x(1)+x(2)
    f(3)= -x(2)         
    f(4)= x(2)
end

% Warunki początkowe
x0 = [1; 1]; % Początkowe wartości 

% Rozwiązanie problemu optymalizacji
[x, fval] = fminimax(@zadanie, x0);

disp('Optymalne rozwiązanie:');
disp(['x(1): ', num2str(x(1))]);
disp(['x(2): ', num2str(x(2))]);

disp(['fval: ', num2str(fval)]);


%Zadanie 4
function f = tank_design(x)

% Funkcje celu do minimalizacji maksymalnej różnicy ciśnień i kosztów
f(1) = pi * x(1)^2 * x(2) - 500; % Objętość zbiornika powinna być 500 m^3
f(2) = 2*pi*x(1)*x(2) + 2*pi*x(1)^2 - 4000; % Powierzchnia materiału poniżej 4000 m^2
f(3) = -x(1); % Promień musi być dodatni
f(4) = -x(2); % Wysokość musi być dodatnia
end

% Warunki początkowe
x0 = [1; 1]; % Początkowe wartości promienia i wysokości
lb = [0.1; 0.1]; % Dolne ograniczenia (promień i wysokość > 0)
ub = []; % Brak górnych ograniczeń


[x, fval] = fminimax(@tank_design, x0, [], [], [], [], lb, ub, [], options);
% Rozwiązanie problemu optymalizacji

disp('Optymalne wymiary zbiornika:');
disp(['Promień: ', num2str(x(1))]);
disp(['Wysokość: ', num2str(x(2))]);


%Zadanie 5 
% Parametry problemu
calories = [100, 50];  % Kalorie w porcji owsianki i mleka
protein = [5, 3];      % Białko w porcji owsianki i mleka
cost = [2, 3];         % Koszt owsianki i mleka

% Minimalne wymagania
min_calories = 500;    % Minimalna liczba kalorii
min_protein = 30;      % Minimalna liczba gramów białka

% Funkcja celu: minimalizacja maksymalnego kosztu diety
objective = @(x) cost * x;  % Całkowity koszt owsianki i mleka

% Ograniczenia nierówności: zaspokojenie wymagań kalorycznych i białkowych
A = [-calories; -protein];  % Ujemne, ponieważ ograniczenia są w formie <=
b = [-min_calories; -min_protein];

% Dodatkowe ograniczenie: proporcje muszą być nieujemne
lb = [0, 0];  % Dolne ograniczenie (brak negatywnych porcji)

% Rozwiązanie za pomocą fminimax
x0 = [1, 1];  % Punkt początkowy
[x, fval] = fminimax(@(x) [cost(1)*x(1), cost(2)*x(2)], x0, A, b, [], [], lb, []);

% Wyświetlenie wyników
fprintf('Optymalna liczba porcji:\n');
fprintf('Owsianka: %.2f porcji\n', x(1));
fprintf('Mleko: %.2f porcji\n', x(2));
fprintf('Minimalny maksymalny koszt: %.2f zł\n', max(fval));