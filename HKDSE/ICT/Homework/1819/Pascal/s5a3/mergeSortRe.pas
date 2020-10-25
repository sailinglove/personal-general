program mergeSortRe;

type
  arrtype = array[1..100] of integer;

var
  temp_arr, ori_arr, sort_arr : arrtype;
  i : integer;

procedure merge(var arr, tarr : arrtype; ord, x1, x2 : integer;);
  var
    i1, i2, j : integer;
  begin
    j := 1;
    i1 := x1; i2 := x2;
    while (i1 < (x1 + ord)) and (i2 < (x2 + ord)) do
      begin
        if arr[i1] < arr[i2] then
          begin
            tarr[j] := arr[i1];
            i1 := i1 + 1;
          end
        else
          begin
            tarr[j] := arr[i2];
            i2 := i2 + 1;
          end;
        j := j + 1;
      end;
    while (i1 < (x1 + ord)) and (i1 < x2) do
      begin
        tarr[j] := arr[i1];
        i1 := i1 + 1;
        j := j + 1
      end;
    while (i2 < (x2 + ord)) do
      begin
        tarr[j] := arr[i2];
        i2 := i2 + 1;
        j := j + 1;
      end;
  end;

begin
  for i := 1 to 40 do
    ori_arr[i] := random(10000);
  for i := 1 to 39 do
    if (i mod 10) = 0 then
      writeln(ori_arr[i]:6)
    else
      write(ori_arr[i]:6);
  writeln(ori_arr[40]:6);
  ord := 2;
  while ord <= 20 do
    begin
      for i := (40 mod 2) downto 1 do
        merge
    end;
  merge(ori_arr, temp_arr, 20, 1, 21);
  for i := 1 to 39 do
    if (i mod 10) = 0 then
      writeln(temp_arr[i]:6)
    else
      write(temp_arr[i]:6);
  readln;
end.
