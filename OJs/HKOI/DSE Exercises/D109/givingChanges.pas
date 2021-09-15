program givingChanges;

var
  input, temp : LongInt;

procedure idk(value : Integer);
begin
  repeat
    temp := input div value;
    if temp > 0 then
      begin
        WriteLn(value);
        input := input - value;
      end;
  until temp = 0;
end;

begin
  ReadLn(input);
  idk(1000);
  idk(500);
  idk(100);
  idk(50);
  idk(20);
  idk(10);
end.