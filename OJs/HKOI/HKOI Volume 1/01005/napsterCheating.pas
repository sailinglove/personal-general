program napsterCheating;

var
  input, name : AnsiString;

procedure swap(var a, b : Char);
var
  t : Char;
begin
  t := a; a := b; b := t;
end;

procedure strReversal(var s : AnsiString);
var
  l, r : Integer;
begin
  l := 1; r := Length(s);
  while l < r do
    begin
      swap(s[l], s[r]);
      Inc(l); Dec(r);
      // WriteLn(s);
    end;
end;

begin
  ReadLn(input);
  name := Copy(input, 1, Length(input) - 4);
  strReversal(name);
  WriteLn(name + Copy(input, Length(input) - 3, 4));
end.