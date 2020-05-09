program simpleCalculator;

var
  or1, or2, or3 : Integer;
  ot1, ot2 : String[3];
  output : LongInt;
  temp : Integer;
  tot1, tot2 : Integer;

function fkCase(ot : String) : Integer;  //fuck 'case' statement for only accepting ordinal types!!!!!!!!
begin
  if ot = ' + ' then
    fkCase := 0
  else if ot = ' - ' then
    fkCase := 1
  else if ot = ' * ' then
    fkCase := 2;
end;

begin
  ReadLn(or1, ot1, or2, ot2, or3);
  tot1 := fkCase(ot1); tot2 := fkCase(ot2);
  if tot2 = 2 then
    begin
      temp := or2 * or3;
      case tot1 of
        0 : output := or1 + temp;
        1 : output := or1 - temp;
        2 : output := or1 * temp;
      end;
    end
  else
    begin  
      case tot1 of
        0 : temp := or1 + or2;
        1 : temp := or1 - or2;
        2 : temp := or1 * or2;
      end;
      case tot2 of
        0 : output := temp + or3;
        1 : output := temp - or3;
      end;
    end;
  WriteLn(output);
end.