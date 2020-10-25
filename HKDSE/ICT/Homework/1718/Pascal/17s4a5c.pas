program y17s4a5c;
{ Programmer Name  : Ivan Xiang
  Class            : S.4B
  Class No.        : 31
  Compiling Date   : 2nd Apr., 2018
  Program File Name: y17s4a5c.pas
  Purpose          : This program accept 9 number into a 3x3 array, and check if
                     the non-zero numbers have repeated or not, and give a
                     output of 'vaild' or 'invaild' depends on the numbers.}

var
  n : array[1..3, 1..3] of integer; //two-dimension array to hole the 3x3 number
  i, j : integer;                   //counter for operation of the 2D array
  a, b : integer;                   { counter for operation of the copy of the
                                      2D array for checking repeated number}
  v : boolean;                      //memory for the repeated number

begin
  v := true;  //initialize the var.
  for i := 1 to 3 do  //accept the numbers
    begin
      write('Enter the number in row ', i, ' : ');
      for j := 1 to 2 do
        read(n[i, j]);
      readln(n[i, 3]);  //accept the 3rd one alone to ensure the presence of
    end;                //'readln' command

  {check the non-zero numbers is present before or not by running two set of the
   2D array and check them against each other, if the a number is present
   before, the var. 'v' will be set as 'false'}
  for i := 1 to 3 do
    for j := 1 to 3 do
      if n[i, j] <> 0 then
        for a := 1 to 3 do
          for b := 1 to 3 do
            if (i <> a) and (j <> b) and (n[i, j] = n[a, b]) then
              begin
                v := false;
                break;
              end;
  //determind the 3x3 array is valid or not by the var. 'v'
  if v = true then
    writeln('Valid input.')
  else
    writeln('Invalid input.');
  readln
end.
