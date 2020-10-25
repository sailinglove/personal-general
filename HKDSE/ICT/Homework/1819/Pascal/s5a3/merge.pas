program merge;

uses
  sysutils;

var
  f1, f2, result : text;
  fn1, fn2, dir1, dir2, dirr : string;

procedure setF;
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
  end;

procedure merge();
  var
    n1, n2 : integer;
  begin
    ReadLn(f1, n1);
    ReadLn(f2, n2);
    repeat
      if not(eof(f1)) and not(eof(f2)) then
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
        end
      else
        begin
          if eof(f1) and not eof(f2) then
            begin
              if n1 < n2 then
                WriteLn(result, n1)
              else
                begin
                  WriteLn(result, n2);
                  ReadLn(f2, n2);
                  WriteLn(result, n1);
                end;
              repeat
                WriteLn(result, n2);
                ReadLn(f2, n2);
              until eof(f2);
              Write(result, n2);
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
              else
                begin
                  if n1 < n2 then
                    begin
                      WriteLn(result, n1);
                      Write(result, n2);
                    end
                  else
                    begin
                      WriteLn(result, n2);
                      Write(result, n1);
                    end;
                end;
            end;
        end;
    until eof(f1) and eof(f2);
  end;

begin
  write('Enter the name of the first file: ');
  readln(fn1);
  write('Enter the name of the second file: ');
  readln(fn2);
  setF;
  merge;
  close(f1);
  close(f2);
  close(result);
  writeln('Please find the merged list in the file "result.txt".');
  readln
end.