program s5a3a;
  { Programmer Name  :  Ivan Xiang
    Class            :  S.5B
    Class No.        :  31
    Compiling Date   :  27st Jan., 2019
    Program File Name:  s5a3a.pas
    Purpose          :  This program generate a list of random numbers (0 to 9999) and
                        allows user to choose one of the sorting algorithms (bubble 
                        sort, insertion sort and merge sort) to compare the number of 
                        comparisons respectively.}

uses crt;

type
  arrtype = array[1..1000] of integer;

var
  ori_arr, sorted_arr, temp_arr : arrtype;
  //ori_arr: original unsorted list of numbers; sorted_arr: sorted list of numbers
  //temp_arr: temporary list of numbers for sorting
  size, dec, com : integer;
  //size: size of the list; dec: decision on the choice of sorting algorithms
  //com: counter for comparison

procedure swap(var x, y : integer);
//procedure to swap the values in two variable parameters
//x, y: variable to be swapped
  var
    t : integer;
    //temporary variable
  begin
    t := x;
    x := y;
    y := t;
  end;

procedure genlist(var n : integer);
//procedure to accept the size of the list and generate the random values into the list
//n: size
  var
    ip : integer;
    //counter for 'for' loop
  begin
    write('Enter the number of items to be sorted (100-1000): ');
    readln(n);
    randomize;
    for ip := 1 to n do
      ori_arr[ip] := random(10000);
  end;

procedure showlist(var arr: arrtype; n : integer);
//procedure to display the values in the given array
//arr: given array(ori_arr / sorted_arr); n: size
  var
    ip : integer;
    //counter for 'for' loop
  begin
    for ip := 1 to (n-1) do
      if (ip mod 10) = 0 then
        writeln(arr[ip]:6)
      else
        write(arr[ip]:6);
      //to arrange the output in a width of 10 numbers
    writeln(arr[n]:6)
    //to continue the rest output on a new line
  end;

procedure copylist(n : integer);
//procedure to copy the contents from the original list to the one to be sorted.
//n: size
  var
    ip : integer;
    //counter for 'for' loop
  begin
    for ip := 1 to n do
      sorted_arr[ip] := ori_arr[ip];
  end;

procedure choose(var n : integer);
//procedure to allow user to choose the desired sorting algorithm or to end the program
//n: dec
  begin
    writeln('Press <Enter> to continue...');
    readln;
    clrscr;
    writeln('1. insertion sort');
    writeln('2. bubble sort');
    writeln('3. merge sort');
    writeln('4. exit');
    write('Choose a sorting algorithm or exit : ');
    readln(n);
    writeln;
  end;

procedure inSort(var arr : arrtype; max : integer);
//procedure to perform insertion sort
//arr: sorted_arr; max: size
  var
    cur_pos, pt_pos, tp, ip : integer;
    //cur_pos: pointer of current position; pt_pos: pointer 
    //tp: temporary varible; ip: counter
  begin
    cur_pos := 1;
    //initailize cur_pos
    repeat
      cur_pos := cur_pos + 1;
      pt_pos := 1;
      while pt_pos <= cur_pos do
        begin
          if arr[cur_pos] < arr[pt_pos] then
            begin
              tp := arr[cur_pos];
              for ip := cur_pos downto (pt_pos + 1) do
                arr[ip] := arr[ip - 1];
              arr[pt_pos] := tp;
            end;
          com := com + 1;
          pt_pos := pt_pos + 1;
        end; 
    until cur_pos = max;  
  end;

procedure bubSort(var arr : arrtype; n : integer);
//procedure to perform bubble sort
//arr: sorted_arr; n: size
  var
    flag : boolean;
    ip : integer;
    //flag: identifier of occurence of swap; ip: counter
  begin
    repeat
      flag := false;
      //initialize the flag
      for ip := 1 to (n - 1) do
        begin
          if arr[ip] > arr[ip+1] then
            begin
              swap(arr[ip], arr[ip + 1]);
              flag := true;
            end;
          //compare the numbers, swap them if neccessary
          com := com + 1;
        end;
    until (not flag);
  end;

procedure Merge(var A, temp : arrtype; left, middle, right : Integer);
//procedure to merge the lower and higher part of a array, where both part is sorted.
//A: sorted_arr; temp: temp_arr
//left: lower boundary of the list to be merged in the array
//middle: the middle point of the list to be merged
//right: the higher boundary of the list}
	var
		pointLow, pointHigh, pointTemp, count, highLength : Integer;
    //pointLow: pointer for lower list; pointHign: pointer for higher list
    //pointTemp: pointer for temporary list; count: counter;
    //highLength: variable stores the length of the higher list
	begin
		pointLow := left;
		pointHigh := middle + 1;
		pointTemp := left;
    //initialize the pointers
		repeat
			if A[pointLow] <= A[pointHigh] then
				begin
					temp[pointTemp] := A[pointLow];
					pointLow := pointLow + 1;
          com := com + 1;
				end
			else
				begin
					temp[pointTemp] := A[pointHigh];
					pointHigh := pointHigh + 1;
          com := com + 1;
				end;
      { compare the numbers that the pointer is pointing in both list, and copy the 
        smaller one to the list 'temp'}
			pointTemp := pointTemp + 1;
		until (pointLow > middle) or (pointHigh > right);
		highLength := right - middle;
    //calculate the length of higher list
		if pointLow > middle
			then
				for count := pointHigh to right do
					temp[count] := A[count]
			else
				for count := pointLow to middle do
				  temp[count + highLength] := A[count];
    //copy the remaining numbers to the list 'temp'
		for count := left to right do
			A[count] := temp[count];
    //copy the array
	end;

procedure merSort(var A, temp : arrtype; left, right : Integer);
//procedure to do sorting by merging
//A: sorted_arr; temp: temp_arr; left: lower boundary of the list to be sorted;
//right: higher boundary
	var
		middle : Integer;
    //middle point of the list to be sorted
	begin
		if left < right then
    //check if the length of the list is larger than 1
			begin
				middle := (left + right) div 2;
				merSort(A, temp, left, middle);
				merSort(A, temp, middle + 1, right);
				Merge(A, temp, left, middle, right);
         {sort the list by divide the list into smaller list of length 1 then merge
          them together}
			end;
	end;

procedure sortExe(n : integer);
//procedure to execute the desired sorting function according to the user's choice
  begin
    copylist(size);
    com := 0;
    //initialize the counter for comparison
    case n of
      1 : inSort(sorted_arr, size);
      2 : bubSort(sorted_arr, size);
      3 : merSort(sorted_arr, temp_arr, 1, size);
    end;
    //execute the sorting algorithm
    if n <> 4 then
      begin
        showlist(sorted_arr, size);
        writeln('Total number of comparison : ', com);
      end;
  end;

begin
//main program
  genlist(size);
  showlist(ori_arr, size);
  repeat
    choose(dec);
    sortExe(dec);
  until dec = 4;
  //end the program if user's choice is 4
end.