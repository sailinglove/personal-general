var
  s : String;
  i, j : Integer;

function FInsert(s, h, t : String; hL, cL : Integer) : String;
var
  pos : Integer;
begin
  Val(Copy(s, hL + 2+8+1, cL - 8-1), pos);
  FInsert := Copy(h, 1, pos - 1) + t + Copy(h, pos, hL - pos + 1);
end;

begin
  s := '"Music is my love" Insert 7 "not "';
  WriteLn(FInsert(s, 'Music is my love', 'not ', 16, 10));
end.