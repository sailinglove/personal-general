program textGraphic;

var
  i, j, input : Integer;

begin
  ReadLn(input);

  for i := 1 to ((input div 2) + 1) do
  begin
    for j := 1 to ((input div 2) + 1 - i) do
      Write(' ');
    Write('#');
    if i = 1 then
      WriteLn
    else
    begin
      for j := 1 to (i * 2 - 3) do
        Write(' ');
      WriteLn('#');
    end;
  end;
end.