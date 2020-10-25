program mergeSort;

type
  arrtype = array[1..1000] of integer;

var
  ori_arr, sorted_arr, temp_arr : arrtype;
  size : integer;

procedure genlist(var n : integer);
  var
    ip : integer;
  begin
    write('Enter the number of items to be sorted (100-1000): ');
    readln(n);
    randomize;
    for ip := 1 to n do
      ori_arr[ip] := random(10000);
  end;

procedure showlist(var arr: arrtype; n : integer);
  var
    ip : integer;
  begin
    for ip := 1 to (n-1) do
      if (ip mod 10) = 0 then
        writeln(arr[ip]:6)
      else
        write(arr[ip]:6);
    writeln(arr[n]:6)
  end;

procedure copylist(n : integer);
  var
    ip : integer;
  begin
    for ip := 1 to n do
      sorted_arr[ip] := ori_arr[ip];
  end;

procedure Merge(var A, temp : arrtype; left, middle, right : Integer);
	var
		pointLow, pointHigh, pointTemp : Integer;
		highlength : Integer;
		count : Integer;
	begin
		pointLow := left;
		pointHigh := middle + 1;
		pointTemp := left;
		repeat
			if A[pointLow] <= A[pointHigh] then
				begin
					temp[pointTemp] := A[pointLow];
					pointLow := pointLow + 1;
				end
			else
				begin
					temp[pointTemp] := A[pointHigh];
					pointHigh := pointHigh + 1;
				end;
			pointTemp := pointTemp + 1;
		until (pointLow > middle) or (pointHigh > right);
		highlength := right - middle;
		if pointLow > middle
			then
				for count := pointHigh to right do
					temp[count] := A[count]
			else
				for count := pointLow to middle do
				  temp[count + highlength] := A[count];
		for count := left to right do
			A[count] := temp[count];
	end;

procedure MergeSort(var A, temp : arrtype; left, right : Integer);
	var
		middle : Integer;
	begin
		if left < right then
			begin
				middle := (left + right) div 2;
				MergeSort(A, temp, left, middle);
				MergeSort(A, temp, middle + 1, right);
				Merge(A, temp, left, middle, right);
			end;
	end;

begin
  genlist(size);
  showlist(ori_arr, size);
  copylist(size);
  MergeSort(sorted_arr, temp_arr, 1, size);
  showlist(sorted_arr, size);
end.