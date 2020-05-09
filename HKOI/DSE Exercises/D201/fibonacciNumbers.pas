program fibonacciNumbers;

var
  input : Integer;

function fibonacciX(X : Integer) : LongInt;
begin
  if X > 1 then
    fibonacciX := fibonacciX(X - 1) + fibonacciX(X - 2)
  else if X > 0 then
    fibonacciX := 1
  else fibonacciX := 0;
end;

begin
  ReadLn(input);
  WriteLn(fibonacciX(input));
end.