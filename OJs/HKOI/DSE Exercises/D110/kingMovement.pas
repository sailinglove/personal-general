program kingMovement;

var
  x1, x2, y1, y2 : Char;

begin
  ReadLn(x1, y1);
  ReadLn(x2, y2);
  if Abs(Ord(x1) - Ord(x2)) > Abs(Ord(y1) - Ord(y2)) then
    WriteLn(Abs(Ord(x1) - Ord(x2)))
  else
    WriteLn(Abs(Ord(y1) - Ord(y2)));
end.