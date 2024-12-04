%Zadania 1 - 3
function f=zadanie(x)
    f(1)=
    f(2)= 
end

% Warunki początkowe
x0 = []; % Początkowe wartości 

% Rozwiązanie problemu optymalizacji
[x, fval] = fminimax(@zadanie, x0);

disp('Optymalne rozwiązanie:');
disp(['x(1): ', num2str(x(1))]);
disp(['x(2): ', num2str(x(2))]);

disp(['fval: ', num2str(fval)]);


%Zadanie 4
function f = tank_design(x)

% Funkcje celu do minimalizacji maksymalnej różnicy ciśnień i kosztów
f(1) =  % Objętość zbiornika powinna być 500 m^3
f(2) =  % Powierzchnia materiału poniżej 4000 m^2
f(3) =  % Promień musi być dodatni
f(4) =  % Wysokość musi być dodatnia
end

% Warunki początkowe
x0 = []; % Początkowe wartości promienia i wysokości
lb = []; % Dolne ograniczenia (promień i wysokość > 0)
ub = []; % Brak górnych ograniczeń


[x, fval] = fminimax(@tank_design, x0, [], [], [], [], lb, ub, [], options);
% Rozwiązanie problemu optymalizacji

disp('Optymalne wymiary zbiornika:');
disp(['Promień: ', num2str(x(1))]);
disp(['Wysokość: ', num2str(x(2))]);


%Zadanie 5 

calories = [];  % Kalorie w porcji owsianki i mleka
protein = [];      % Białko w porcji owsianki i mleka
cost = [];         % Koszt owsianki i mleka

% Minimalne wymagania
min_calories = ;    % Minimalna liczba kalorii
min_protein = ;      % Minimalna liczba gramów białka

% Funkcja celu: minimalizacja maksymalnego kosztu diety
objective = @(x) ;  % Całkowity koszt owsianki i mleka

% Ograniczenia nierówności: zaspokojenie wymagań kalorycznych i białkowych
A = [];  
b = [];


lb = [];  % Dolne ograniczenie 

% Rozwiązanie za pomocą fminimax
x0 = [1, 1];  % Punkt początkowy
[x, fval] = fminimax(@(x) [cost(1)*x(1), cost(2)*x(2)], x0, A, b, [], [], lb, []);

% Wyświetlenie wyników
fprintf('Optymalna liczba porcji:\n');
fprintf('Owsianka: %.2f porcji\n', x(1));
fprintf('Mleko: %.2f porcji\n', x(2));
fprintf('Minimalny maksymalny koszt: %.2f zł\n', max(fval));
