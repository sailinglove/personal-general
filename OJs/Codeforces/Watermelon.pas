program Watermelon;

var
  input : Integer;

begin
  ReadLn(input);
  if (input mod 2) = 0 then
    if input <> 2 then
      WriteLn('YES')
    else
      writeLn('NO')
  else
    WriteLn('NO');
end.