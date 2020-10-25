program y17s4a5a;
{ Programmer Name  : Ivan Xiang
  Class            : S.4B
  Class No.        : 31
  Compiling Date   : 16st Mar., 2018
  Program File Name: y17s4a5a.pas
  Purpose          : This program recieve the marks of ten students and give
                     them grades according to their marks, then output the times
                     that a grade appear.}

var
  m : array[1..10] of integer;      //array to hold the marks of ten students.
  gm : array['A'..'E'] of integer;  //array for counter of the five grade//
  i : integer;                      //counter for operation of array 'm'
  g : char;                         //counter for operation of array 'gm'

begin
  for g := 'A' to 'E' do  //initialize the counter for five grades
    gm[g] := 0;
  writeln('Enter marks of 10 students:');
  for i := 1 to 9 do
    repeat
      read(m[i]);                        //input the marks
    until (m[i] > -1) and (m[i] < 101);  //valid the inputs
  repeat
    readln(m[10]);                       //input the marks
  until (m[10] > -1) and (m[10] < 101);  //valid the marks*
  for i := 1 to 10 do
    case m[i] of                         //count the appearence of the grades
      0..39 : gm['E'] := gm['E'] + 1;
      40..49 : gm['D'] := gm['D'] + 1;
      50..64 : gm['C'] := gm['C'] + 1;
      65..79 : gm['B'] := gm['B'] + 1;
      80..100 : gm['A'] := gm['A'] + 1;
    end;
  for g := 'A' to 'E' do
    writeln('No. of students with grade ', g, ' : ', gm[g]);
  readln
end.

{*: the 'readln' command will not read the input before the last number in
    front of a '\r'(line break), therefore 'read' command is used and the last
    number is operated seperatelt with a 'readln' command for later convenient.}
