program appendInsertReplace;

type
  TCommand = (Append, Cut, Insert, Replace);

const
  appendLength = 8;   //' Append '
  cutLength = 5;    //' Cut '
  replaceLength = 9;    //' Replace '

var
  input, output : array[1..50] of String;
  host, target : String;
  count, i, hostLength, commandLength, targetLength, targetPos, inPos : Integer;
  command : TCommand;

function FFindSubString(h, t : String; hL, tL : Integer) : Integer;
var
  i, j : Integer;
  flag : Boolean;
begin
  i := 0; flag := false;
  while (i <= hL) and (flag <> True) do
  begin
    Inc(i);
    if (h[i] = t[1]) then
    begin
      flag := true;
      for j := 1 to (tL) do
        if h[i + j - 1] <> t[j] then
          flag := false;
    end;
  end;
  if (flag = false) then
    FFindSubString := -999
  else
    FFindSubString := i;
end;

function FFindQuotationMark(s : String; n : Integer) : Integer;
var
  i, counter : Integer;
begin
  i := 0; counter := 0;
  while (i <= Length(s)) and (counter <> n) do
  begin
    Inc(i);
    if (s[i] = '"') then
      Inc(counter);
  end;
  FFindQuotationMark := i;
end;

function FQuotedCutter(s : String; lp : Integer; var l : Integer) : String;
var 
  i : Integer;
begin
  i := lp; l := 0;
  while (s[i] <> '"') do
  begin
    Inc(l); Inc(i);
  end;
  FQuotedCutter := Copy(s, lp, l);
end;

function FOperatorDeterminer(var cL : Integer; s : String) : TCommand;
begin
  case Ord(s[hostLength + 4]) of
    Ord('A') : begin FOperatorDeterminer := Append; cL := appendLength; end;
    Ord('C') : begin FOperatorDeterminer := Cut; cl := cutLength; end;
    Ord('I') : begin FOperatorDeterminer := Insert; cL := FFindQuotationMark(s, 3) - 
                                                          FFindQuotationMark(s, 2) - 1; end;
    Ord('R') : begin FOperatorDeterminer := Replace; cL := replaceLength; end;
  end;
end;

function FAppend(h, t : String) : String;
begin
  FAppend := h + t;
end;

function FCut(h, t : String; hL, tL: Integer; var tp : Integer) : String;
begin
  tp := FFindSubString(h, t, hL, tL);
  if tp = -999 then
    FCut := h
  else
    FCut := Copy(h, 1, tp - 1) + Copy(h, tp + tL, hL - tp + 1 - tL);
end;

function FInsert(h, t : String; hL, p : Integer) : String;
begin
  // Val(Copy(s, hL + 2+8+1, cL - 8-1), p);
  FInsert := Copy(h, 1, p - 1) + t + Copy(h, p, hL - p + 1);
end;

function FReplace(s, h, t : String; hL, tL : Integer) : String;
var
  temp, t2 : String;
  tp, tL2 : Integer;
begin
  temp := FCut(h, t, hL, tL, tp);
  if temp = h then
    FReplace := h  
  else
  begin
    t2 := FQuotedCutter(s, FFindQuotationMark(s, 5) + 1, tL2);
    FReplace := FInsert(temp, t2, Length(temp), tp);
  end;
end;

begin
  ReadLn(count);
  for i := 1 to count do
    ReadLn(input[i]);
  
  for i := 1 to count do
  begin
    host := FQuotedCutter(input[i], 2, hostLength);
    // WriteLn(host);

    command := FOperatorDeterminer(commandLength, input[i]);
    // WriteLn(command);

    target := FQuotedCutter(input[i], FFindQuotationMark(input[i], 3) + 1, targetLength);
    // WriteLn(target);

    case command of
      Append : output[i] := FAppend(host, target);
      Cut : output[i] := FCut(host, target, hostLength, targetLength, targetPos);
      Insert : begin Val(Copy(input[i], hostLength + 2+8+1, commandLength - 8-1), inPos);
                     output[i] := FInsert(host, target, hostlength, inPos); end;
      Replace : output[i] := FReplace(input[i], host, target, hostlength, targetLength);
    end;

    Write('Command #', i, ': "');
    WriteLn(output[i] + '"');
  end;
end.