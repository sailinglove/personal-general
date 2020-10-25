program repeatCheck;
(* Programmer Name  : Ivan Xiang
   Class            : S.4B
   Class No.        : 31
   Compiling Date   : th Oct, 2017
   Program File Name: 17s4a3b.pas
   Purpose          : To check a group of character of lenght-4 if there is any
                      repeated characters.
*)

var
  a, b, c, d, e : char;  //to setup variabale for the compare.

begin
  write('Enter a 4/5-character code: ');
  readln(a, b, c, d);
  write('It is a ');

  //to compare each character with another to check if any of them is repeated
  if (a = b) or (a = c) or (a = d) or (a = e) or (b = c) or (b = d) or
     (b = e) or (c = d) or (c = e) or (d = e) then
    write('in')
  else
    write('');
  writeln('valid code.');
  readln
end.