procedure ms();
var n1, n2 : integer; at, bt, ct : text;
begin
  assign(at, 'a.txt');
  assign(bt, 'b.txt');
  assign(ct, 'result.txt');
  
  reset(at);
  reset(bt);
  rewrite(ct);

  readln(at, n1);
  readln(bt, n2);
  repeat
    if not eof(at) and not eof(bt) then
      begin
        if n1 < n2 then
        begin
          writeln(ct, n1);
          readln(at, n1)
        end
        else
        begin
          writeln(ct, n2);
          readln(bt, n2)
        end
      end
    else if eof(at) and not eof(bt) then
      begin
        writeln(ct, n2);
        readln(bt, n2)
      end;
  until
end;