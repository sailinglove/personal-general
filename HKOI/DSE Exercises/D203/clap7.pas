program clap7;

const
  S = 'Clap';

var
  input : Integer;
  i, j : Integer;

begin
  ReadLn(input);

  for i := 0 to 9 do begin
    for j := 1 to 9 do
      if (i = input) or (j = input) or ((i*10+j)/input = Trunc((i*10+j)/input)) then
        Write(S, ' ')
      else
        Write(i * 10 + j, ' ');
    if (i+1 = input) or ((i+1)*10/input = Trunc((i+1)*10/input)) then
      WriteLn(S)
    else
      WriteLn((i+1)*10);
  end;
end.