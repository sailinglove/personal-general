program s5a3b;
  { Programmer Name  :  Ivan Xiang
    Class            :  S.5B
    Class No.        :  31
    Compiling Date   :  31st Jan., 2019
    Program File Name:  s5a3a.pas
    Purpose          :  This program . }

uses
  sysutils;

var
  f1, f2, result : text;
  //directory varible for text files
  //f1: file 1; f2: file 2; result: result file;
  fn1, fn2, dir1, dir2, dirr : string;
  //fn1: name of file 1; fn2: name of file 2; dir1: directory of file 1
  //dir2: directory of file 2

procedure setF;
{ procedure to link inputted file names with the current working directory of the
  program }
  begin
    dir1 := GetCurrentDir + '\' + fn1;
    dir2 := GetCurrentDir + '\' + fn2;
    dirr := GetCurrentDir + '\result.txt';
    assign(f1, dir1);
    reset(f1);
    assign(f2, dir2);
    reset(f2);
    assign(result, dirr);
    rewrite(result);
    //set up file 1 & 2 for read and result file for write
  end;

procedure merge();
//procedure to merge two files
  var
    n1, n2 : integer;
  begin
    ReadLn(f1, n1);
    ReadLn(f2, n2);
    repeat
      if not(eof(f1)) and not(eof(f2)) then
      //both files have not yet reach the end
        begin
          if n1 <= n2 then
            begin
              WriteLn(result, n1);
              ReadLn(f1, n1);
            end
          else
            begin
              WriteLn(result, n2);
              ReadLn(f2, n2);
            end;
          //output the larger data
        end
      else
        begin
          if eof(f1) and not eof(f2) then
          //only file 1 reached the end of file
            begin
              if n1 < n2 then
                WriteLn(result, n1)
                { output the last datum of file 1 if the data is smaller than the 
                  datum from file 2}
              else
                begin
                  WriteLn(result, n2);
                  ReadLn(f2, n2);
                  WriteLn(result, n1);
                end;
                { output the datum of file 2 first if the datum from file 1 is
                  larger}
              repeat
                WriteLn(result, n2);
                ReadLn(f2, n2);
              until eof(f2);
              Write(result, n2);
              //output all the remainging data from file 2 to result
            end
          else
            begin
              if not eof(f1) and eof(f2) then
                begin
                  if n1 > n2 then
                    WriteLn(result, n2)
                  else
                    begin
                      WriteLn(result, n1);
                      ReadLn(f1, n1);
                      WriteLn(result, n2);
                    end;
                  repeat
                    WriteLn(result, n1);
                    ReadLn(f1, n1);
                  until eof(f1);
                  Write(result, n1);
                end
                //refer to above but this time file 2 reached its end 
              else
                begin
                  if n1 < n2 then
                  { all the previous condition is not satisfied, means both files 
                    reached their end at the same time}
                    begin
                      WriteLn(result, n1);
                      Write(result, n2);
                    end
                  else
                    begin
                      WriteLn(result, n2);
                      Write(result, n1);
                    end;
                  //output the last datum of both files  
                end;
            end;
        end;
    until eof(f1) and eof(f2);
    //repeat the loop until both files have ended
  end;

begin
//main program
  write('Enter the name of the first file: ');
  readln(fn1);
  write('Enter the name of the second file: ');
  readln(fn2);
  setF;
  //receive the file names and link the file
  merge;
  //merge the files
  close(f1);
  close(f2);
  close(result);
  writeln('Please find the merged list in the file "result.txt".');
  readln
end.