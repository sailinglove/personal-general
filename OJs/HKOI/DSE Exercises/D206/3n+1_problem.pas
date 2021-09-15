program p3nPlus1_problem;

var
    N : Integer;

procedure CollatzConjecture(var n : Integer);
begin
    writeLn(n);
    if n <> 1 then
    begin
        if (n mod 2) = 0 then
            n := n div 2
        else
            if (n mod 2) = 1 then
                n := 3 * n + 1;
    CollatzConjecture(n);
    end;
end;

begin
    ReadLn(N);

    CollatzConjecture(N);
end.