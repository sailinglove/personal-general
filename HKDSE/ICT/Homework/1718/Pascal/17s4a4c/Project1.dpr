program chessboardGenerator;
(* Programmer Name  : Ivan Xiang
   Class            : S.4B
   Class No.        : 31
   Compiling Date   : 21st Nov., 2017
   Program File Name: 17s4a4c.pas
   Purpose          : This program generate a chess board according to user
                      required border thickness and size.
*)

uses
  Crt;  (*preset program set 'Crt' is used because command 'ClrScr' is needed in
          this program*)

var
  lineThick, size, h, w : integer;

begin
  //ask the user to input the thickness of the chessboard and valid the datd
  repeat
  write('(1) Single-lined or (2)Double-lined : ');
  readln(lineThick);
  until (lineThick = 1) or (lineThick = 2);

  //ask the user to input the size of the chessboard and valid the datd
  repeat
  write('Size of the board (1-10) : ');
  readln(size);
  until (size >= 1) and (size <= 10);

  ClrScr;  //clear the screen

  if lineThick = 1 then  //chessboard generation of thickness of 1
    begin
      for h := (size - 1) downto 0 do  (*generate the suitable 'height' of the
                                         chessboard*)
        begin
          for w := (size - 1) downto 0 do  //
            write('+---');                 //
          writeln('+');                    //(*generate suitable 'width' of the
          for w := (size - 1) downto 0 do  //  chessboard*)
            write('|   ');                 //
          writeln('|');                    //

        end;
      for w := (size - 1) downto 0 do  //(*complete the generation of the
            write('+---');             //  chessboard*)
          writeln('+');                //
    end
  else     (*chessboard generation of thickness of 2, as the value of the
             chessboard is controlled in 1 or 2 in preious data control loop*)
    begin
      for h := (size - 1) downto 0 do  (*generate the suitable 'height' of the
                                         chessboard*)
        begin
          for w := (size - 1) downto 0 do  //
            write('#===');                 //
          writeln('#');                    //(*generate suitable 'width' of the
          for w := (size - 1) downto 0 do  //  chessboard*)
            write('|   ');                 //
          writeln('|');                    //

        end;
      for w := (size - 1) downto 0 do  //(*complete the generation of the
            write('#===');             //  chessboard*)
          writeln('#');                //
    end;

  readln
end.
