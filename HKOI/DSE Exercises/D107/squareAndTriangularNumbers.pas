program squareAndTriangularNumbers;

var
  input : LongInt;
  ifSq, ifTri : Boolean;

function chkSquare(num : LongInt) : Boolean;
var
  i, t : LongInt;
begin
  i := 0; chkSquare := False;
  repeat
    Inc(i);
    t := i * i;
    // WriteLn(t:3, num:3);
    if t = num then
      chkSquare := True;
  until t >= num;
end;

function chkTri(num : LongInt) : Boolean;
var
  i, t : LongInt;
begin
  i := 0; t := 0; chkTri := False;
  repeat
    Inc(i);
    t := t + i;
    // WriteLn(t);
    if t = num then
      chkTri := True;
  until t >= num;
end;

begin
  ReadLn(input);
  ifSq := chkSquare(input);
  // WriteLn(ifSq);
  ifTri := chkTri(input);
  // WriteLn(ifTri);
  if ifSq and ifTri then
    WriteLn('Both');
  if ifSq and not ifTri then
    WriteLn('Square');
  if ifTri and not ifSq then
    WriteLn('Triangular');
  if not ifSq and not ifTri then
    WriteLn('Neither');
end.