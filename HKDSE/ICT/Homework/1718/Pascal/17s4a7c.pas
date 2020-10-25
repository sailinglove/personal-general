program s4a7c;
{ Programmer Name  : Ivan Xiang
  Class            : S.4B
  Class No.        : 31
  Compiling Date   : 16th May, 2018
  Program File Name: 17s4a7c.pas
  Purpose          : This program accept a set of integers of 3x3 then check if
                     any number is repeated, blank space excluded.(sudoku rule)}

var                              //global varible
  a : array[1..3] of string[3];  //array to hold the set of numbers
  msame : boolean;               //master boolean varible for repeated ot not
  j : integer;                   //counter for loop

function CheckRow (r : integer) : boolean;  {function to check repetitiveness
                                             within rows.}
  var                //local varible
    same : boolean;  //local boolean varible for repetitiveness within rows
  begin
    same := false;  //initialise varible
    //check for repetitiveness within rows but ignoring blank space
    if ((a[r][1] <> ' ') and (a[r][2] <> ' ')) and (a[r][1] = a[r][2]) then
      same := true;
    if ((a[r][1] <> ' ') and (a[r][3] <> ' ')) and (a[r][1] = a[r][3]) then
      same := true;
    if ((a[r][2] <> ' ') and (a[r][3] <> ' ')) and (a[r][2] = a[r][3]) then
      same := true;
    CheckRow := same;
  end;

function CheckCol (c : integer) : boolean;  {function to check repetitiveness
                                             within columns.}
  var                //local varible
    same : boolean;  //local boolean varible for repetitiveness within columns
  begin
    same := false;  //initialise varible
    //check for repetitiveness within columns but ignoring blank space
    if ((a[1][c] <> ' ') and (a[2][c] <> ' ')) and (a[1][c] = a[2][c]) then
      same := true;
    if ((a[1][c] <> ' ') and (a[3][c] <> ' ')) and (a[1][c] = a[3][c]) then
      same := true;
    if ((a[2][c] <> ' ') and (a[3][c] <> ' ')) and (a[2][c] = a[3][c]) then
      same := true;
    CheckCol := same;
  end;

begin
  msame := false;  //initialise varible
  for j := 1 to 3 do  //accept numbers
    begin
      write('Enter the number in row ', j, ' : ');
      readln(a[j]);
    end;
  for j := 1 to 3 do  //check retitiveness
    begin
      if CheckRow(j) then  //use CheckRow function as condition expression
        begin
          writeln('Error in row ', j, '.'); //warn the user if condition is true
          msame := true;
        end;
      if CheckCol(j) then  //use CheckCol function as condition expression
        begin                               //warn the user if condition is true
          writeln('Error in column ', j, '.');
          msame := true;
        end;
    end;
  if not msame then  //ckeck if all rows and columns have not repetitiveness
    writeln('All correct.');  //inform the user if condition is true
  readln
end.
