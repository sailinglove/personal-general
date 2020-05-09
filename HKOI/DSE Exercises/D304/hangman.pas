program hangman;

var
  inputS, temp : String;
  guess : Char;
  i, count : Integer;

procedure check(g : Char; s : String; var t : String);
var
  j : Integer;
begin
  for j := 1 to Length(s) do
    if g = s[j] then
      begin
        t[j] := s[j];
        Inc(count);
      end;
end;

begin
  count := 0;
  ReadLn(inputS);
  // WriteLn(inputS);
  for i := 1 to Length(inputS) do
    temp[i] := '_';
  // for i := 1 to Length(inputS) - 1 do
  //   Write(temp[i]);
  // WriteLn(temp[Length(inputS)]);
  // WriteLn(temp);
  while count < Length(inputS) do
    begin
      ReadLn(guess);
      check(guess, inputS, temp);
      for i := 1 to Length(inputS) - 1 do
        Write(temp[i]);
      WriteLn(temp[Length(inputS)]);
    end;
end.