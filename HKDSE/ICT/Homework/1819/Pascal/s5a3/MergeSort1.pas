program MergeSort;

const
	num = 7;

type
	ArrayType = array[1..num] of Integer;

var
	List, TempList : ArrayType;

procedure InputData;
	begin
		List[1] := 9;
		List[2] := 15;
		List[3] := 12;
		List[4] := 20;
		List[5] := 6;
		List[6] := 4;
		List[7] := 8;
	end;

procedure Merge(var A, temp : ArrayType; left, middle, right : Integer);
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

procedure MergeSort(var A, temp : ArrayType; left, right : Integer);
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

procedure DisplayList(A : ArrayType);
	var
		count : Integer;
	begin
		for count := 1 to num do
			write(A[count] :3);
	end;

begin
	InputData;
	Write('Before sort: ');
	DisplayList(List);
	MergeSort(List, TempList, 1, num);
	WriteLn;
	Write('After sort: ');
	DisplayList(List);
end.