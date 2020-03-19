program calculator;
uses crt,sysutils;
label
  start;
const
  az = 'abdefghijklmnopqrstuvwyz';
  num = '0123456789';
var
  i,a,s,c,n,k,o,p,q : Integer;
  result:real;
  key : char;
  nilai : array[0..99] of shortstring;
  angka : array[0..13] of char;

begin
  start:

  {Mengubah semua variabel yang dipakai ke nilai awal}
  i:=0;
  k:=0;
  for a:=1 to 13 do angka[a]:=chr(0);
  result:=0;
  nilai[0]:='';
  nilai[1]:='';
  nilai[2]:='';

  clrscr();
  writeln('---------------------------------------------------');
  writeln('|                                                 |');
  writeln('|                                                 |');
  writeln('|                                                 |');
  writeln('---------------------------------------------------');
  writeln('-----------Created-by-M.Adipati-Rezkya-------------');
  writeln('---------------------------------------------------');
  writeln('|             |            |            |         |');
  writeln('|             |      C     |      X     |    +    |');
  writeln('|             |    Reset   | Close App  |         |');
  writeln('|             |            |            |         |');
  writeln('|      1      |      2     |      3     |    -    |');
  writeln('|             |            |            |         |');
  writeln('|             |            |            |         |');
  writeln('|      4      |      5     |      6     |    *    |');
  writeln('|             |            |            |         |');
  writeln('|             |            |            |         |');
  writeln('|      7      |      8     |      9     |    /    |');
  writeln('|             |            |            |         |');
  writeln('|             |            |            |         |');
  writeln('|             |      0     |            |    =    |');
  writeln('|             |            |            |         |');
  writeln('---------------------------------------------------');

  repeat
  key := readkey;  {pengambilan input langsung}


  {cek bahwa yang di input bukan huruf atau simbol lain selain angka}
  c:=0;
  n:=0;
  for a:=1 to 26 do
  begin
    if(key <> az[a]) then c:=c+1;
    if(a<=10) and (key = num[a]) then n:=n+1;
  end;

  {proses output}
  if(nilai[0] <> '') and ((nilai[1] = '+') or (nilai[1] = '-') or (nilai[1] = '*') or (nilai[1] = '/')) and (nilai[2]='') then
  begin
    for s:=1 to 9 do
    begin
      {Membuat key yang digunakan menyala pada gadget}
      if(s<=3) then q:=11 else if(s>3) and (s<=6) then q:=14 else if(s>6) and (s<=9) then q:=17;
      if(strtoint(key) mod 3=1) then
      begin
        o:=2;
        p:=14;
      end;
      if(strtoint(key) mod 3=2) then
      begin
        o:=16;
        p:=26;
      end;
      if(strtoint(key) mod 3=0) then
      begin
        o:=29;
        p:=39;
      end;
      if(key = inttostr(s)) then
      begin
        for a:=o to p do
        begin
          gotoxy(a,q);
          write('֍');
        end;
        for a:=o to p do
        begin
          gotoxy(a,q+2);
          write('֍');
        end;
        delay(20);
      end;
    end;
    if(key = '0') then    {Jika angka yang diimasukkan sama dengan 0 maka akan melakukan warna pada tombol angka 0 di gadget}
      begin
        for a:=16 to 26 do
        begin
          gotoxy(a,20);
          write('֍');
        end;
        for a:=16 to 26 do
        begin
          gotoxy(a,22);
          write('֍');
        end;
        delay(80);
    end;
    {Reset array angka menjadi semula}
    for a:=1 to 13 do angka[a]:=chr(0);
    i:=0;
    k:=k+2;
  end;
  if(c>=26) and (n>0) then angka[i]:=key;   {Penggunaan kondisi untuk mencari bahwa key yang inputkan adalah angka maka angka per index adalah key yang diinputkan (angka)}
  nilai[k]:=Concat(angka);  {array nilai di index k adalah hasil penggabungan semua index dari array angka}
  clrscr();
  writeln(ord(key));
  writeln('---------------------------------------------------');
  write('|'); Gotoxy(51,2); writeln('|');

  write('|');
  if(nilai[1]<>'') then
  begin
    Gotoxy(26,2);
    for s:=i to 12 do write(' ');
    write(nilai[0]);
  end;
  Gotoxy(26,3);
  for s:=i to 12 do write(' ');
  for a:=0 to i do if not(key in ['+','-','/','*', '=']) and not(ord(key)=13) then write(angka[a]);    {jika key yang diinputkan bukan merupakan aritmatika dan bukan enter atau samadengan maka menuliskan array angka perindex tanpa menggunakan new line}
  if(nilai[1]<>'') then  {jika aritmatika(-+/*) sudah di inputkan maka nilai yang sudah diinputkan sebelumnya akan meletakkan nilai tersebut ke atas}
  begin
    Gotoxy(40,3);
    write(' ',nilai[1]);
  end;


  if(ord(key) = 13) or (key='=') then  {mencari input Enter atau SamaDengan(=)}
  begin
    if(nilai[2]<>'') then
    begin
      Gotoxy(26,3);
      for s:=i to 12 do write(' ');
      write(nilai[2]);
      if(nilai[1]='+') then result:=(strtoint(nilai[0])+strtoint(nilai[2]));
      if(nilai[1]='-') then result:=(strtoint(nilai[0])-strtoint(nilai[2]));
      if(nilai[1]='*') then result:=(strtoint(nilai[0])*strtoint(nilai[2]));
      if(nilai[1]='/') then result:=(strtoint(nilai[0])/strtoint(nilai[2]));
      Gotoxy(26,4);
      for s:=i to 12 do write(' ');
      if(nilai[1]='/') then write(result:1:3) else write(result:0:0);

    end
    else          {Jika key adalah enter atau '=' tapi nilai kedua tidak ada maka akan melakukan error dan kembali ke awal}
    begin
      nilai[0]:='';
      nilai[1]:='';
      nilai[2]:='';
      for a:=0 to 13 do angka[a]:=chr(0);
      Gotoxy(26,3);
      write('ERROR');
      Gotoxy(51,3);
      write('|');
      Gotoxy(1,4);
      write('|');
      Gotoxy(51,4);
      writeln('|');
      writeln('---------------------------------------------------');
      writeln('-----------Created-by-M.Adipati-Rezkya-------------');
      writeln('---------------------------------------------------');
      writeln('|             |            |            |         |');
      writeln('|             |      C     |      X     |    +    |');
      writeln('|             |    Reset   | Close App  |         |');
      writeln('|             |            |            |         |');
      writeln('|      1      |      2     |      3     |    -    |');
      writeln('|             |            |            |         |');
      writeln('|             |            |            |         |');
      writeln('|      4      |      5     |      6     |    *    |');
      writeln('|             |            |            |         |');
      writeln('|             |            |            |         |');
      writeln('|      7      |      8     |      9     |    /    |');
      writeln('|             |            |            |         |');
      writeln('|             |            |            |         |');
      writeln('|             |      0     |            |    =    |');
      writeln('|             |            |            |         |');
      writeln('---------------------------------------------------');
      delay(3000);
      clrscr();
      writeln('---------------------------------------------------');
      writeln('|                                                 |');
      writeln('|                                                 |');
      writeln('|                                                 |');
      writeln('---------------------------------------------------');
      writeln('-----------Created-by-M.Adipati-Rezkya-------------');
      writeln('---------------------------------------------------');
      writeln('|             |            |            |         |');
      writeln('|             |      C     |      X     |    +    |');
      writeln('|             |    Reset   | Close App  |         |');
      writeln('|             |            |            |         |');
      writeln('|      1      |      2     |      3     |    -    |');
      writeln('|             |            |            |         |');
      writeln('|             |            |            |         |');
      writeln('|      4      |      5     |      6     |    *    |');
      writeln('|             |            |            |         |');
      writeln('|             |            |            |         |');
      writeln('|      7      |      8     |      9     |    /    |');
      writeln('|             |            |            |         |');
      writeln('|             |            |            |         |');
      writeln('|             |      0     |            |    =    |');
      writeln('|             |            |            |         |');
      writeln('---------------------------------------------------');
      i:=0;
    end;
  end;

  if(key in ['c','C']) then goto start;   {jika key yang diinputkan adalah C maka akan mereset semua nilai yang dimasukkan}

  Gotoxy(51,3);
  writeln('|');
  if (key in ['+','-','/','*']) then
  begin
    if(ord(angka[0]) <> 0) then
    begin
      nilai[1]:=key;
      Gotoxy(26,2);
      for s:=i to 12 do write(' ');
      write(nilai[0]);
      Gotoxy(1,4);
      write('|');
      Gotoxy(39,3);
      write(key);
      Gotoxy(51,4);
      writeln('|');
      i:=0;
    end;
  end;
  write('|'); Gotoxy(51,4); writeln('|');
  writeln('---------------------------------------------------');
  writeln('-----------Created-by-M.Adipati-Rezkya-------------');
  writeln('---------------------------------------------------');
  writeln('|             |            |            |         |');
  writeln('|             |      C     |      X     |    +    |');
  writeln('|             |    Reset   | Close App  |         |');
  writeln('|             |            |            |         |');
  writeln('|      1      |      2     |      3     |    -    |');
  writeln('|             |            |            |         |');
  writeln('|             |            |            |         |');
  writeln('|      4      |      5     |      6     |    *    |');
  writeln('|             |            |            |         |');
  writeln('|             |            |            |         |');
  writeln('|      7      |      8     |      9     |    /    |');
  writeln('|             |            |            |         |');
  writeln('|             |            |            |         |');
  writeln('|             |      0     |            |    =    |');
  writeln('|             |            |            |         |');
  writeln('---------------------------------------------------');
  repeat if(c>=26) and (n>0) then i:=i+1; until (ord(angka[13]) = 0)
  until (key in ['x','X']);  {dari atas melakukan repeat until sampai key tersebut menginputkan X maka akan langsung keluar dari perulangan repeat}
end.
