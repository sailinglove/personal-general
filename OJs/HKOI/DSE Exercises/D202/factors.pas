program factors;

var
  input : LongInt;
  i, j : LongInt;
  temp : Real;
  tFac : array[1..100] of LongInt;

begin
  ReadLn(input);
  j := 0;
  for i := 1 to Trunc(Sqrt(input)) do begin
      temp := input / i;
      if temp = Trunc(temp) then begin
        Inc(j);
        tFac[j] := Trunc(temp);
        tFac[50 + j] := i;
      end;
  end;
  if Sqrt(input) = Trunc(Sqrt(input)) then
    for i := 1 to j - 1 do begin
      WriteLn(tFac[50 + i]);
    end
  else
    for i := 1 to j do begin
      WriteLn(tFac[50 + i]);
    end;
  for i := j downto 1 do begin
    WriteLn(tFac[i]);
  end;
end.