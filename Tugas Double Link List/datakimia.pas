program DataKimiaWithDoubleLinkList;
uses crt;

type
    Point = ^Data;
    Alat = record
        Total : integer;
        Kode,Nama : string;
    end;    
    Data = record
        Info : Alat;
        Prev, Next : Point;
    end;

var
    Awal, Akhir,Debug : Point;
    MenuUtama, SubMenu,SubPilih  : integer;

procedure MenuAwal(var MenuUtama : integer);
{I.S : user mememilih data dari menu utama}
{F.S : user menampilkan menu yang telah di dipilih}
begin
    textbackground(8);
    textcolor(15);
    writeln;
    gotoxy(38,7); writeln ('----------------MENU UTAMA---------------');
    gotoxy(38,8); writeln ('   1. Sisip Data                       ');
    gotoxy(38,9); writeln ('   2. Hapus data                       ');
    gotoxy(38,10); writeln('   3. Cari data                        ');
    gotoxy(38,11); writeln('   4. Tampil data                      ');
    gotoxy(38,12); writeln('   0. Keluar                           ');
    gotoxy(38,13); writeln('-----------------------------------------');
    gotoxy(38,14); writeln('Masukkan Pilihan Anda :                   ');
    gotoxy(38,15); writeln('-----------------------------------------');
    gotoxy(63,14); readln(MenuUtama);

    // validasi Menu Utama
    while(MenuUtama < 0) or (MenuUtama > 4) do 
    begin
        gotoxy(38,17); textcolor(12); 
        writeln('Menu Pilihan Hanya 0/1/2/3/4, Ulangi!');
        readln;
        gotoxy(38,17); clreol;
        gotoxy(63,14); clreol; textcolor(3); readln(MenuUtama);
    end;
end;

procedure MenuSisip(var SubMenu : integer);
{I.S : user mememilih data dari Menu Sisip}
{F.S : user menampilkan data yang telah di dipilih}
begin
    clrscr;
    textbackground(8);
    textcolor(15);
    writeln;
    gotoxy(38,7); writeln ('----------------MENU SISIP----------------');
    gotoxy(38,8); writeln ('   1. Sisip Depan                       ');
    gotoxy(38,9); writeln ('   2. Sisip Tengah                      ');
    gotoxy(38,10); writeln('   3. Sisip Belakang                    ');
    gotoxy(38,11); writeln('   0. Keluar                            ');
    gotoxy(38,12); writeln('------------------------------------------');
    gotoxy(38,13); writeln('Masukkan Pilihan Anda :                  ');
    gotoxy(38,14); writeln('------------------------------------------');
    gotoxy(63,13); readln(SubMenu);

    //validasi Menu dari Menu Sisip
    while(SubMenu < 0 ) or (SubMenu > 3) do
    begin
        gotoxy(38,16); textcolor(12); 
        writeln('Menu Pilihan Hanya 0/1/2/3/4, Ulangi!');
        readln;
        gotoxy(38,16); clreol;
        gotoxy(63,13); clreol; textcolor(3); readln(SubMenu);
    end;
end;

procedure MenuSisipTengah(var SubPilih : integer);
{I.S : user mememilih data dari Menu Sisip}
{F.S : user menampilkan data yang telah di dipilih}
begin
    clrscr;
    textbackground(8);
    textcolor(15);
    writeln;
    gotoxy(38,7);  writeln ('---------------SISIP TENGAH-------------');
    gotoxy(38,8);  writeln ('   1. Sebelum                           ');
    gotoxy(38,9);  writeln ('   2. Setelah                           ');
    gotoxy(38,10); writeln ('   0. Keluar                            ');
    gotoxy(38,12); writeln ('----------------------------------------');
    gotoxy(38,13); writeln ('Masukkan Pilihan Anda :                 ');
    gotoxy(38,14); writeln ('----------------------------------------');
    gotoxy(63,13); readln(SubPilih);

    //validasi Menu dari Menu Sisip
    while(SubPilih < 0 ) or (SubPilih > 2) do
    begin
        gotoxy(38,16); textcolor(12); 
        writeln('Menu Pilihan Hanya 0/1/2/ Ulangi!');
        readln;
        gotoxy(38,16); clreol;
        gotoxy(63,13); clreol; textcolor(3); readln(SubPilih);
    end;
end;

procedure MenuHapusData(var SubMenu : integer);
{I.S : user mememilih data dari Menu Sisip}
{F.S : user menampilkan data yang telah di dipilih}
begin  
    clrscr;
    textbackground(8);
    textcolor(15);
    writeln;
    gotoxy(38,7); writeln ('----------------MENU HAPUS----------------');
    gotoxy(38,8); writeln ('   1. Hapus Depan                       ');
    gotoxy(38,9); writeln ('   2. Hapus Tengah                      ');
    gotoxy(38,10); writeln('   3. Hapus Belakang                    ');
    gotoxy(38,11); writeln('   0. Keluar                            ');
    gotoxy(38,12); writeln('------------------------------------------');
    gotoxy(38,13); writeln('Masukkan Pilihan Anda :                  ');
    gotoxy(38,14); writeln('------------------------------------------');
    gotoxy(63,13); readln(SubMenu);

    //validasi Menu dari Menu Sisip
    while(SubMenu < 0 ) or (SubMenu > 3) do
    begin
        gotoxy(38,16); textcolor(12); 
        writeln('Menu Pilihan Hanya 0/1/2/3/4, Ulangi!');
        readln;
        gotoxy(38,16); clreol;
        gotoxy(63,13); clreol; textcolor(3); readln(SubMenu);
    end;
end;

procedure MenuCari(var SubMenu : integer);
{I.S : user mememilih data dari Menu Sisip}
{F.S : user menampilkan data yang telah di dipilih}
begin
    clrscr;
    textbackground(8);
    textcolor(15);
    writeln;
    gotoxy(38,7); writeln ('----------------MENU CARI---------------------------');
    gotoxy(38,8); writeln ('   1. Cari Data Dengan Kode                      ');
    gotoxy(38,9); writeln ('   2. Cari Data Dengan Nama                      ');
    gotoxy(38,10); writeln('   3. Cari Data Dengan Jumlah                    ');
    gotoxy(38,11); writeln('   0. Kembali Ke Menu                            ');
    gotoxy(38,12); writeln('----------------------------------------------------');
    gotoxy(38,13); writeln('Masukkan Pilihan Anda :                            ');
    gotoxy(38,14); writeln('----------------------------------------------------');
    gotoxy(63,13); readln(SubMenu);

    //validasi Menu dari Menu Sisip
    while(SubMenu < 0 ) or (SubMenu > 3) do
    begin
        gotoxy(38,15); textcolor(12); 
        writeln('Menu Pilihan Hanya 0/1/2/3/4, Ulangi!');
        readln;
        gotoxy(38,15); clreol;
        gotoxy(63,13); clreol; textcolor(3); readln(SubMenu);
    end;
end;

procedure MenuCariDataWithJumlah(var SubPilih : integer);
{I.S : user mememilih data dari Menu Sisip}
{F.S : user menampilkan data yang telah di dipilih}
begin
    clrscr;
    textbackground(8);
    textcolor(15);
    writeln;
    gotoxy(38,7);  writeln ('---------------CARI DATA DENGAN JUMLAH-------------');
    gotoxy(38,8);  writeln ('   1. Cari Data Dengan Jumlah Kurang Dari      ');
    gotoxy(38,9);  writeln ('   2. Cari Data Dengan Jumlah Lebih Dari       ');
    gotoxy(38,10); writeln ('   0. Keluar                                   ');
    gotoxy(38,12); writeln ('-----------------------------------------------');
    gotoxy(38,13); writeln ('Masukkan Pilihan Anda :                        ');
    gotoxy(38,14); writeln ('---------------------------------------------------');
    gotoxy(63,13); readln(SubPilih);

    //validasi Menu dari Menu Sisip
    while(SubPilih < 0 ) or (SubPilih > 2) do
    begin
        gotoxy(38,16); textcolor(12); 
        writeln('Menu Pilihan Hanya 0/1/2/ Ulangi!');
        readln;
        gotoxy(38,16); clreol;
        gotoxy(63,13); clreol; textcolor(3); readln(SubPilih);
    end;
end;

function DataAlat() : Alat;
{I.S : user memasukkan DataAlat yang ingin dimasukkan}
{F.S : Menghasilkan Data Alat Baru}
var
    Data : Alat;
begin
    clrscr;
    textbackground(8);
    textcolor(15);
    writeln;
    gotoxy(38,7); writeln ('------------------------------------');
    gotoxy(38,8); write ('Kode Alat    : '); readln(Data.Kode);
    while(Data.Kode = ' ') or (Data.Kode = '') do
     begin
      gotoxy(38,13);write('Kode tidak boleh kosong!');
      gotoxy(38,14);write('Enter untuk Memasukkan Kembali!');readln;
      gotoxy(38,13);clreol;gotoxy(38,14);clreol;
      gotoxy(54,8);clreol;readln(Data.Kode);
     end;
    gotoxy(38,9); write ('Nama Alat    : '); readln(Data.Nama);
    gotoxy(38,10); write('Banyak Alat  : '); readln(Data.Total);
    while(Data.Kode = ' ') or (Data.Kode = '') do
     begin
      gotoxy(38,13);write('Kode tidak boleh kosong!');
      gotoxy(38,14);write('Enter untuk Memasukkan Kembali!');readln;
      gotoxy(38,13);clreol;gotoxy(38,14);clreol;
      gotoxy(54,8);clreol;readln(Data.Kode);
     end;
    while(Data.Total < 0) do
     begin
      gotoxy(38,13);write('Banyak tidak boleh dibawah 0!');
      gotoxy(38,14);write('Enter untuk Memasukkan Kembali!');readln;
      gotoxy(38,13);clreol;gotoxy(38,14);clreol;
      gotoxy(45,10);clreol;readln(Data.Kode);
     end;
    gotoxy(38,11); writeln('------------------------------------');
    DataAlat := Data;
end;

procedure Penciptaan(var Awal,Akhir : Point);
begin
    Awal := nil;
    Akhir := nil;    
end;

procedure SisipDepan(var Awal, Akhir : Point);
{I.S : user memasukkan data yang akan di sisipkan di depan}
{F.S : menampilkan data baru yang akan disisipkan di depan}
var
    Baru : Point;
begin
    new(Baru);
    Baru^.Info := DataAlat();
    Baru^.Prev := nil;
    if(Awal = nil)
        then
            begin
                Baru^.Next := nil;
                Akhir := Baru;
            end
        else
            begin
                Baru^.Next := Awal;
                Awal^.Prev := Baru;
            end;
        Awal := Baru;    
        gotoxy(38,12); write('Data Berhasil Ditambahkan!');
end;

procedure SisipBelakang(var Awal,Akhir : Point);
{I.S : user memasukkan data yang akan di sisipkan di belakang}
{F.S : menampilkan data baru yang akan disisipkan di belakang}
var 
    Baru : Point;
begin
    new(Baru);
    Baru^.info := DataAlat();
    Baru^.Next := nil;

    if(Akhir = nil)
        then
            begin
                Baru^.Prev := nil;
                Awal := Baru;
            end
        else   
            begin
                Baru^.Prev := Akhir;
                Akhir^.Next := Baru;
            end;

        Akhir := Baru;
        gotoxy(38,12); write('Data Berhasil Ditambahkan!');
end;

procedure SisipTengahSebelum(var Awal,Akhir : Point);
{I.S : memasukkan data dengan disisipkan ditengah node sebelumnya }
{F.S : menampilkan data yang telah disisipkan di tengah sebelum}
var
    Bantu, Baru : Point;
    Ketemu : boolean;
    counter, Node : integer;
begin
    clrscr;
    new(Baru);
    Baru^.info := DataAlat();
    if(Awal = nil)
        then
            begin
                Baru^.Prev := nil;
                Baru^.Next := nil;
                Awal := Baru;
                Akhir := Baru;
            end
        else
            begin
            repeat
                gotoxy(38,14);
                gotoxy(42,13);clreol;
                gotoxy(38,13);write('Menyisipkan Data sebelum Node ke : '); readln(Node);
                counter := 1;
                Bantu := Awal;
                ketemu := false;
                while(Bantu <> nil) and (not Ketemu) do
                begin
                    if(counter = Node)
                        then
                         begin
                            Ketemu := True;
                         end
                        else
                            begin
                                counter := counter + 1;
                                Bantu := Bantu^.Next;
                            end;
                end; // endwhile
                if(not Ketemu) then
                 begin
                  gotoxy(38,14);write('Node Tidak Ditemukan Ulangi Lagi!');
                  gotoxy(38,15);write('Tekan Enter!');
                  readln;
                  gotoxy(38,14);clreol;gotoxy(38,15);clreol;
                 end;
            until(Node > 0) AND (Ketemu);
                        if(Ketemu) and (Bantu = Awal)
                            then
                                begin
                                    Baru^.Prev := nil;
                                    Baru^.Next := Awal;
                                    Awal^.Prev := Baru;
                                    Awal := Baru;
                                end
                            else
                                begin
                                    Baru^.Next := Bantu;
                                    Baru^.Prev := Bantu^.Prev;
                                    Bantu^.Prev^.Next := Baru;
                                    Bantu^.Prev := Baru;
                                end;
            end;
end;

Procedure SisipTengahSetelah(var Awal, Akhir : Point);
{I.S : memasukkan data dengan disisipkan ditengah node setelahnya }
{F.S : menampilkan data yang telah disisipkan di tengah setelah}
var
    bantu, baru : point;
    counter, node : integer;
    ketemu : boolean;
begin
  clrscr;
  New(Baru);
  Baru^.info := DataAlat();

  if(Awal = Nil) then
   begin
        Awal := Baru;
        Akhir := Baru;
        Baru^.next := nil;
        Baru^.prev := nil;
   end
  else
   begin
   repeat
                gotoxy(38,14);
                gotoxy(42,13);clreol;
                gotoxy(38,13);write('Menyisipkan Data sebelum Node ke : '); readln(Node);
                counter := 1;
                Bantu := Awal;
                ketemu := false;
                while(Bantu <> nil) and (not Ketemu) do
                begin
                    if(counter = Node)
                        then
                         begin
                            Ketemu := True;
                         end
                        else
                            begin
                                counter := counter + 1;
                                Bantu := Bantu^.Next;
                            end;
                end; // endwhile
                if(not Ketemu) then
                 begin
                    gotoxy(38,14);write('Node Tidak Ditemukan Ulangi Lagi!');
                    gotoxy(38,15);write('Tekan Enter!');
                    readln;
                    gotoxy(38,14);clreol;gotoxy(38,15);clreol;
                 end;
            until(Node > 0) AND (Ketemu);

      if(Ketemu) And (Bantu = Akhir) then
       begin
            Akhir^.next := Baru;
            Baru^.prev := Akhir;
            Baru^.next := Nil;
            Akhir := Baru;
       end
      else
       begin
            Baru^.next := Bantu^.next;
            Baru^.prev := Bantu;
            Bantu^.next := Baru;
            Baru^.next^.prev := Baru;
       end;
   end;
end;

procedure HapusDepan(var Awal, Akhir : Point);
{I.S : data sudah terdefinisi}
{F.S : menghapus data dari sisip depan}
var
    Phapus : Point;
begin
    Phapus := Awal;

    if(Awal = Akhir)
        then
            Penciptaan(Awal,Akhir)
        else
            begin
                Awal := Awal^.Next;
                Awal^.Prev := nil;
            end;
    
    dispose(Phapus);
    gotoxy(38,10); write('Data Berhasil Dihapus..'); readln;
end;

procedure HapusBelakang(var Awal,Akhir : Point);
{I.S : data sudah terdefinisi}
{F.S : menghapus data dari sisip belakang}
var
    Phapus : Point;
begin
    Phapus := Akhir;

    if(Awal = Akhir)
        then
            Penciptaan(Awal,Akhir)
        else
            begin
                Akhir := Akhir^.Prev;
                Akhir^.Next := nil;
            end;

    dispose(Phapus);
    gotoxy(38,10); write('Data Berhasil Dihapus..'); readln;
end;

Procedure HapusTengah(var Awal, Akhir : Point);
{I.S : data sudah terdefinisi}
{F.S : menghapus data dari sisip tengah}
var
    bantu, phapus : point;
    kodecari : string;
    ketemu : boolean;
begin
    if(Awal = Akhir) then
    begin
        Penciptaan(Awal,Akhir);
    end
    else
    begin
        ketemu := false;

        Repeat // Cari Kode
        gotoxy(38,5);clreol;
        gotoxy(38,5);write('Masukkan Kode cari : ');readln(kodecari);
        bantu := awal;
        while(bantu <> nil) and (not Ketemu) do
        begin
            if(Kodecari = bantu^.info.kode) then
                Ketemu := True
            else
                    Bantu := Bantu^.next;
            end;
        until(Ketemu); // Cari Kode

        if(Ketemu) and (Bantu = Awal) then
        begin
            HapusDepan(Awal,Akhir)
        end
        else if(Ketemu) and (Bantu = Akhir) then
        begin
            HapusBelakang(Awal,Akhir);
        end
        else // Hapus Tengah
        begin
            Phapus := Bantu;
            Bantu := Bantu^.prev;
            Bantu^.next := Phapus^.next;
            Phapus^.next^.prev := Bantu;
            Phapus^.next := Nil;
            Phapus^.prev := nil;
        end;
    end;
  Dispose(Phapus);
  gotoxy(38,10); write('Data Berhasil Dihapus..'); readln;
end;

procedure CariKode(Awal : Point);
{I.S : mencari data dengan menggunakan Kode}
{F.S : menampilkan semua data dengan menggunakan Kode}
var
    Bantu : Point;
    Kode : string;
    Ketemu : boolean;
begin
    gotoxy(38,12); write('Masukkan Kode Yang Ingin Dicari : '); readln(Kode);

    Bantu := Awal;
    Ketemu := false;

    while(not Ketemu) and (Bantu <> nil) do
    begin
        if(Bantu^.Info.Kode = Kode)
            then
                Ketemu := true
            else    
                Bantu := Bantu^.Next;
    end;

    if(Ketemu)
        then
            begin
                textbackground(8);
                textcolor(15);
                writeln;
                gotoxy(38,13); write('------------------------------------');
                gotoxy(38,14); write('Data Alat Kimia Dari Kode    : ', Kode);
                gotoxy(38,15); write('Nama Alat                    : ', Bantu^.Info.Nama);
                gotoxy(38,16); write('Quality Alat                 : ', Bantu^.Info.Total);
                gotoxy(38,17); write('------------------------------------');
            end
        else
            begin
                gotoxy(38,14); textcolor(red); write('Data Dengan Kode ', Kode, ' Tidak Ditemukan!');
            end;
end;

procedure CariNama(Awal : Point);
{I.S : mencari data dengan menggunakan Nama}
{F.S : menampilkan semua data dengan menggunakan Nama}
var
    Bantu : Point;
    Nama : string;
    Ketemu : boolean;
begin
    gotoxy(38,12); write('Nama Yang Ingin Dicari : '); readln(Nama);

    Bantu := Awal;
    Ketemu := false;

    while(not Ketemu) and (Bantu <> nil) do
    begin
        if(Bantu^.Info.Nama = Nama)
            then
                Ketemu := true
            else
                Bantu := Bantu^.Next;
    end;

    if(Ketemu)
         then
            begin
                textbackground(8);
                textcolor(15);
                writeln;
                gotoxy(38,13); writeln ('------------------------------------');
                gotoxy(38,14); write('Data Alat Kimia Dari Nama    : ', Nama);
                gotoxy(38,15); write('Kode Alat                    : ', Bantu^.Info.Kode);                
                gotoxy(38,16); write('Nama Alat                    : ', Bantu^.Info.Nama);
                gotoxy(38,17); write('Quality Alat                 : ', Bantu^.Info.Total);
                gotoxy(38,18); writeln('------------------------------------');
            end
        else
            begin
                gotoxy(38,14); textcolor(red); write('Data Dengan Nama ', Nama, ' Tidak Ditemukan!');
            end;
end;

Procedure CariKurangDari(Awal : point);
{I.S : user memasukkan jumlah yang ingin dicari didata}
{F.S : menampilkan dari seluruh data yang jumlahnya kurang dari yang di inputkan}
var
    bantu : point;
    Dicari,i : integer;
    Ketemu : boolean;
begin
 gotoxy(38,12); write('Jumlah yang dicari kurang dari : '); readln(dicari);
 while(dicari < 0 ) do
  begin
    gotoxy(38,14);write('Jumlah Salah!');
    gotoxy(38,15);write('Enter Untuk Masukkan Kembali!');
    readln;gotoxy(38,15);clreol;gotoxy(38,14);clreol;gotoxy(72,12);
  end;
    clrscr;
    i := 1;
    Bantu := Awal;
    Ketemu := false;

    while(Bantu <> nil) do
    begin
        if(Bantu^.Info.Total <  Dicari)
            then
                begin
                Ketemu := true;
                textbackground(8);
                textcolor(15);
                gotoxy(38,1+2);   write('Data Alat Yang Kurang Dari - ',Dicari);
                gotoxy(38,1+5*i); write('------------------------------------');
                gotoxy(38,2+5*i); write('Kode                         : ', Bantu^.info.kode);
                gotoxy(38,3+5*i); write('Nama Alat                    : ', Bantu^.Info.Nama);
                gotoxy(38,4+5*i); write('Jumlah Alat                  : ', Bantu^.Info.Total);
                gotoxy(38,5+5*i); write('------------------------------------');
                end;
        bantu := Bantu^.next;
        inc(i);
    end;
    if(Not Ketemu) then
     begin
        gotoxy(38,14); textcolor(red); write('Data Tidak Ditemukan!');
     end;
    readln;
end;

Procedure CariLebihDari(Awal : point);
{I.S : user memasukkan jumlah yang ingin dicari didata}
{F.S : menampilkan dari seluruh data yang jumlahnya lebih dari yang di inputkan}
var
    bantu : point;
    Dicari,i : integer;
    Ketemu : boolean;
begin
 gotoxy(38,12); write('Jumlah yang dicari kurang dari : '); readln(dicari);
 while(dicari < 0 ) do
  begin
    gotoxy(38,14);write('Jumlah Salah!');
    gotoxy(38,15);write('Enter Untuk Masukkan Kembali!');
    readln;gotoxy(38,15);clreol;gotoxy(38,14);clreol;gotoxy(72,12);
  end;
    clrscr;
    i := 1;
    Bantu := Awal;
    Ketemu := false;

    while(Bantu <> nil) do
    begin
        if(Bantu^.Info.Total >= Dicari)
            then
                begin
                Ketemu := true;
                textbackground(8);
                textcolor(15);
                gotoxy(38,1+2);   write('Data Alat Yang Kurang Dari - ',Dicari);
                gotoxy(38,1+5*i); write('------------------------------------');
                gotoxy(38,2+5*i); write('Kode                         : ', Bantu^.info.kode);
                gotoxy(38,3+5*i); write('Nama Alat                    : ', Bantu^.Info.Nama);
                gotoxy(38,4+5*i); write('Jumlah Alat                  : ', Bantu^.Info.Total);
                gotoxy(38,5+5*i); write('------------------------------------');
                end;
        bantu := Bantu^.next;
        inc(i);
    end;
    if(Not Ketemu) then
     begin
        gotoxy(38,14); textcolor(red); write('Data Tidak Ditemukan!');
     end;
    readln;
end;

procedure SortKode(var Awal, Akhir : Point);
{I.S : list telah terdefinisi}
{F.S : menghasilkan list yang sudah terurut ASC berdasarkan Kode}
var
    i,j,min : Point;
    temp    : Alat;
begin
    if(Awal <> nil)
        then
            begin
                i := Awal;
                while(i <> Akhir) do
                begin
                    min := i;
                    j := i^.Next;
                    while(j <> nil) do
                    begin
                        if(j^.Info.Kode <= min^.Info.Kode)
                            then
                                min := j;
                            j := j^.Next;
                    end;
                    temp := i^.Info;
                    i^.Info := min^.Info;
                    min^.Info := temp;
                    i := i^.Next;   
                end;
            end;
end;

procedure HapusDuplikat(var Awal, Akhir : Point);
{I.S : data sudah terdefinisi}
{F.S : menghasilkan list yang data nya yang sama sudah terhapus}
var
    Phapus, Bantu, Bantu2 : Point;
begin
    Bantu := Awal;
    while(Bantu <> nil) do
    begin
        Phapus := Bantu^.Next;
        while(Phapus <> nil) do
        begin
            if(Phapus^.Info.Kode = Bantu^.Info.Kode)
                then
                    begin
                    if(Phapus =  Akhir)
                        then
                            begin
                                Phapus^.Prev^.Next := nil;
                                Akhir := Phapus^.Prev;
                            end
                        else
                            begin
                                Phapus^.Prev^.Next := Phapus^.Next;
                                Phapus^.Next^.Prev := Phapus^.Prev;
                            end;
                            Bantu2 := Phapus;
                            Phapus := Phapus^.Next;
                            dispose(Bantu2);
                    end
                else
                        Phapus := Phapus^.Next;
        end;
            Bantu := Bantu^.Next;
    end;
end;

procedure TampilData(Awal : Point);
{I.S : data sudah terdefinisi}
{F.S : menampilkan semua data yang telah dimasukkan dari Sisip Depan,Tengah, & Belakang}
var
    Bantu : Point;
    Baris : integer;
begin
    clrscr;
    if(Awal = nil)
        then
            begin
                textcolor(red);gotoxy(38,12);
                write('Data kosong!');textcolor(7);
            end
        else
        begin
            SortKode(Awal,Akhir);
            HapusDuplikat(Awal,Akhir);
            Bantu := Awal;
            textbackground(8);
            textcolor(15);
            gotoxy(38,11); writeln('Data Alat Kimiah');
            gotoxy(38,12); writeln('----------------');
            gotoxy(38,13); writeln('-------------------------------------------------');
            gotoxy(38,14); writeln('| KODE |    NAMA ALAT       |   QUALITY ALAT    |');
            gotoxy(38,15); writeln('-------------------------------------------------');
            Baris := 1;
            while(Bantu <> nil) do
            begin
                gotoxy(38,15+baris); write('|      |                    |                   |');
                gotoxy(38+2,15+Baris); write(Bantu^.Info.Kode);
                gotoxy(38+12,15+Baris); write(Bantu^.Info.Nama);
                gotoxy(38+39,15+Baris); write(Bantu^.Info.Total);
                inc(Baris);
                Bantu := Bantu^.Next;
            end;
            gotoxy(38,15+baris); write('-------------------------------------------------');
            gotoxy(38,15+baris+1); write('Tekan Enter Untuk Keluar')
        end;
        readln;
end;

procedure Penghancuran(var Awal, Akhir : Point);
{I.S : data sudah terdefinisi}
{F.S : menghapus semua data yang telah diisikan kedalam program}
var
    Phapus : Point;
begin
    while(Awal <> Akhir) do
    begin
        Phapus := Awal;
        Awal := Awal^.Next;
        dispose(Phapus);
    end;
    
    Phapus := Awal;
    Penciptaan(Awal,Akhir);
    dispose(Phapus);
end;

begin
    Penciptaan(Awal,Akhir);
    repeat
    Debug := awal;
    while(Debug <> Nil) do
     begin
      write(Debug^.info.kode,' ');
      debug := debug^.next;
     end;
    clrscr;
    MenuAwal(MenuUtama);
    case (MenuUtama) of
        1 : begin
                repeat
                MenuSisip(SubMenu);
                case (SubMenu) of
                1 : begin
                        clrscr;
                        SisipDepan(Awal,Akhir);
                        readln;
                    end;
                2 : begin
                    repeat
                    MenuSisipTengah(SubPilih);
                     case (SubPilih) of
                     1 : begin
                            clrscr;
                            SisipTengahSebelum(Awal,Akhir);
                         end;
                     2 : begin
                            clrscr;
                            SisipTengahSetelah(Awal,Akhir);
                         end;
                      end;
                    until(SubPilih = 0);
                    end;
                3 : begin
                        clrscr;
                        SisipBelakang(Awal,Akhir);
                        readln;
                    end;
                end;
                until(SubMenu = 0);
            end;
        2 : begin
                repeat
                MenuHapusData(SubMenu);
                case (SubMenu) of
                1 : begin
                        clrscr;
                        HapusDepan(Awal,Akhir);
                        readln;
                    end;
                2 : begin
                        clrscr;
                        HapusTengah(Awal,Akhir);
                        readln;
                    end;
                3 : begin
                        clrscr;
                        HapusBelakang(Awal,Akhir);
                        readln;
                    end;
                end;
                until(SubMenu = 0);
            end;
        3 : begin
                repeat
                MenuCari(SubMenu);
                case (SubMenu) of
                1 : begin
                        clrscr;
                        CariKode(Awal);
                        readln;
                    end;
                2 : begin
                        clrscr;
                        CariNama(Awal);
                        readln;
                    end;
                3 : begin
                    repeat
                    clrscr;
                    MenuCariDataWithJumlah(SubPilih);
                    case SubPilih of
                    1 : begin
                            clrscr;
                            CariKurangDari(Awal);
                            readln;
                        end;
                    2 : begin
                            clrscr;
                            CariLebihDari(Awal);
                            readln;
                        end;
                    end;
                    until(SubPilih = 0);
                    end;
                end;
                until(SubMenu = 0);    
            end;
        4 : begin
                TampilData(Awal);
            end;
    end;
    until(MenuUtama = 0);
    Penghancuran(Awal,Akhir);
end.