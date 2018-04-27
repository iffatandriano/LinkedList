program PinjamBarangLab;
{I.S. : admin memasukkan data barang yang ada di lab, dan memasukkan data peminjaman barang ketika mahasiswa ingin meminjam}
{F.S. : admin menampilkan seluruh data barang yang ada di lab, menampilkan data peminjaman, melakukan pencarian data barang, 
        dan menghapus data barang yang ada di lab}
uses crt;
const
     max_item = 100; //seluruh maks item ketika admin ingin memasukkan ke dalam database
type
    DataBarang = record //tipe data barang lab yaitu array of record
                kode, nm_brg : string ; //kode dan nama barang bertipe data string
                jum : integer; //jumlah dari data barang bertipe integer
               end;
    DataPeminjam = record //tipe data peminjam yaitu array of record
                    kode,nm_peminjam : string; //kode dan nama peminjam bertipe data string
                    jum : integer; //jumlah dari data pinjaman bertipe integer
                   end;
    ArrayBarang = array [1..max_item] of DataBarang;
    ArrayPeminjam = array [1..max_item] of DataPeminjam;
var 
   Barang : ArrayBarang;
   Peminjam : ArrayPeminjam;
   pilih,piliht,pilihm,i,k,j,nBar, nPin : integer;
   KodeDicari : string;

//Procedure Menu-menu

procedure MenuUtama(var pilih : integer);
begin
 gotoxy(48,6);write('==== Tampilkan Data ====');
 gotoxy(48,7);write('1. Masukkan Data');
 gotoxy(48,8);write('2. Tampilkan Data');
 gotoxy(48,9);write('3. Cari Data');
 gotoxy(48,10);write('4. Reset Data');
 gotoxy(48,11);write('0. Keluar');
 gotoxy(48,13);write('Pilihan Anda ? '); readln(pilih);
 //validasi MenuUtama
 while(pilih < 0) or (pilih > 4) do
  begin
   gotoxy(48+15,13);clreol;readln(pilih);
  end; //endwhile
end; //endprocedure

//procedure MenuInputData

procedure MenuInputData(var pilih : integer);
begin
  clrscr;
 gotoxy(48,6);write('==== Masukkan Data ====');
 gotoxy(48,7);write('1. Masukkan Data Barang');
 gotoxy(48,8);write('2. Masukkan Data Peminjam');
 gotoxy(48,9);write('0. Keluar');
 gotoxy(48,11);write('Pilihan Anda ? '); readln(pilih);
 //validasi MenuInputData
 while(pilih < 0) or (pilih > 2) do
   begin
      gotoxy(48,13);write('Menu Input Data hanya 1/2/0, Ulangi!');
      readln;
      gotoxy(48+14,11);clreol; readln(pilih);
   end; //endwhile
end; //endprocedure

//procedure MenuTampil
procedure menuTampil(var pilih : integer);
begin
 clrscr;
 gotoxy(48,6);write('==== Tampilkan Data ====');
 gotoxy(48,7);write('1. Tampilkan Data Barang');
 gotoxy(48,8);write('2. Tampilkan Data Peminjam');
 gotoxy(48,9);write('0. Keluar');
 gotoxy(48,11);write('Pilihan Anda ? '); readln(pilih);
 //validasi MenuTampil
 while(pilih < 0) or (pilih > 2) do
   begin
      gotoxy(48,13);write('Menu Input Data hanya 1/2/0, Ulangi!');
      readln;
      gotoxy(48+14,11);clreol; readln(pilih);
   end; //endwhile
end; //endprocedure

//End Menu-menu

//procedure InputDataBarang
//travelsal Ke-1
procedure InputDataBarang(var Barang : ArrayBarang; var N : integer);
var
    i : integer;
begin
    clrscr;
    gotoxy(49,5);write('Masukkan Banyak Data : '); readln(N); //admin memasukkan jumlah data yang akan dimasukkan
    clrscr;
    for i := 1 to N do
    begin
        gotoxy(41,0+5*i+1);write('== Data Barang Laboratorium Ke- ', i,' ==');
        gotoxy(50,2+5*i);write('Nama Barang      : '); readln(Barang[i].nm_brg);
        gotoxy(50,3+5*i);write('Kode Barang      : '); readln(Barang[i].kode);
        gotoxy(50,4+5*i);write('Jumlah Barang    : '); readln(Barang[i].jum);
    end; //endfor
end; //endprocedure

//procedure InputDataPeminjam
//Travelsal Ke-2

procedure InputDataPeminjam(var Peminjam : ArrayPeminjam;Barang : ArrayBarang; var N : integer; NBar : integer);
var
    i,k : integer;
begin
    clrscr;
    gotoxy(49,5);write('Masukkan Banyak yang akan dipinjam : '); readln(N);
    clrscr;
    for i := 1 to N do
    begin
        k := 1;
        gotoxy(36,0+5*i+1);write('Daftar Peminjaman Alat Laboratorium Sekolah Ke- ', i);
        gotoxy(47,2+5*i);write('Nama Peminjam            : '); readln(Peminjam[i].nm_peminjam);
        gotoxy(47,3+5*i);write('Kode Barang Dipinjam     : '); readln(Peminjam[i].kode);
        //validasi Kode barang yang akan dipinjam disamakan dari kode barang

            while(Peminjam[i].kode <> Barang[k].kode) do
            begin
            inc(k);
            if(k > Nbar) then
            begin
                gotoxy(94,3+5*i);write('Kode Barang tidak Valid!');
                readln;
                gotoxy(74,3+5*i);clreol;readln(Peminjam[i].kode);
                k := 1;
            end;
            end; //endwhile

        gotoxy(47,4+5*i);write('Jumlah Barang Dipinjam   : '); readln(Peminjam[i].jum);
        //validasi data barang yang akan dipinjam dengan dari jum barang
            while(Peminjam[i].jum >= Barang[k].jum) or (Peminjam[i].jum < 0) do
            begin
                gotoxy(94,4+5*i);write('Jumlah Tidak Valid!');
                readln;
                gotoxy(74,4+5*i);clreol;readln(Peminjam[i].jum);
            end; //endwhile
    end; //endfor
end; //endprocedure

//procedure TampilBarang

procedure TampilBarang(Barang : ArrayBarang;Peminjam : ArrayPeminjam; nBar : integer);
var
   i : integer;
begin
  clrscr;
  gotoxy(28,5);write('== Daftar Data Barang =============');
  gotoxy(28,7);write('=================================================================');
  gotoxy(28,8);write('| No | Nama Barang | Kode Barang | Jumlah | Dipinjam | Tersedia |');
  gotoxy(28,9);write('=================================================================');
 for i := 1 to nBar do
  begin
   gotoxy(28,9+i);write('|    |             |             |        |          |          |');
   gotoxy(28+2,9+i);write(i);
   gotoxy(28+7,9+i);write(Barang[i].nm_brg);
   gotoxy(28+21,9+i);write(Barang[i].kode);
   gotoxy(28+35,9+i);write(Barang[i].jum);
   gotoxy(28+44,9+i);write(Peminjam[i].jum);
   gotoxy(28+55,9+i);write(Barang[i].jum - Peminjam[i].jum);
  end; //endfor
  gotoxy(28,9+i+1);write('=================================================================');
  gotoxy(28,9+i+3);write('Tekan Enter untuk keluar');
  readln;
end; //endprocedure

//procedure TampilPeminjam

procedure TampilPeminjam(Peminjam : ArrayPeminjam; Barang : ArrayBarang; nPin : integer);
var
   i : integer;
begin
  clrscr;
  gotoxy(38,5);write('== Daftar Barang Dipinjam =============');
  gotoxy(38,7);write('=============================================');
  gotoxy(38,8);write('| No | Nama Peminjam | Kode Barang | Jumlah |');
  gotoxy(38,9);write('=============================================');
 for i := 1 to nPIn do
  begin
   gotoxy(38,9+i);write('|    |               |             |        |');
   gotoxy(38+2,9+i);write(i);
   gotoxy(38+9,9+i);write(Peminjam[i].nm_peminjam);
   gotoxy(38+23,9+i);write(Peminjam[i].kode);
   gotoxy(38+37,9+i);write(Peminjam[i].jum);
  end; //endfor
  gotoxy(38,9+i+1);write('=============================================');
  readln;
end; //endprocedure

// Mergesort
//Pengurutan Data Barang
procedure mergebrg(var items:ArrayBarang ; al, m, bh : integer);
var
    temp : ArrayBarang;
    dest, apt, bpt, numel : integer;
    tempstr1,tempstr2 : string;
begin
    numel := bh-al+1;
	apt := al;
	bpt := m+1;                                           

	for dest := 1 to numel do
		begin
            tempstr1 := items[bpt].kode;
            tempstr2 := items[apt].kode;
			if (apt > m) or (( bpt <= bh) and (tempstr1 < tempstr2)) then
				begin
					temp[dest] := items[bpt];
					bpt := bpt + 1;
				end
			else
				begin
					temp[dest] := items[apt];
					apt := apt + 1;
				end; //endif
		end; //endfor

	for dest := 1 to numel do
		items[al+dest-1] := temp[dest];
end; //endprocedure

//procedure sortbrg

procedure sortbrg(var items: ArrayBarang; a, b: integer);
var mid: integer;
begin
	if a < b then
		begin
			mid := (a+b) div 2;
			sortbrg(items, a, mid);
			sortbrg(items, mid+1, b);
			mergebrg(items, a, mid, b);
		end; //endif
end; //endprocedure

//Merge Pinjam
//Pengururan Data Peminjam

procedure mergepeminjam(var item:ArrayPeminjam ; al, m, bh : integer);
var
    temp : ArrayPeminjam;
    dest, apt, bpt, numel : integer;
    tempstr1,tempstr2 : string;
begin
    numel := bh-al+1;
	apt := al;
	bpt := m+1;
	for dest := 1 to numel do
		begin
            tempstr1 := item[bpt].kode;
            tempstr2 := item[apt].kode;
			if (apt > m) or (( bpt <= bh) and (tempstr1 < tempstr2)) then
				begin
					temp[dest] := item[bpt];
					bpt := bpt + 1;
				end
			else
				begin
					temp[dest] := item[apt];
					apt := apt + 1;
				end; //endif
		end; //endfor

	for dest := 1 to numel do
		item[al+dest-1] := temp[dest];
end; //endprocedure

//procedure sortpeminjam

procedure sortpeminjam(var item: ArrayPeminjam; a, b: integer);
var mid: integer;
begin
	if a < b then
		begin
			mid := (a+b) div 2;
			sortpeminjam(item, a, mid);
			sortpeminjam(item, mid+1, b);
			mergepeminjam(item, a, mid, b);
		end; //endif
end; //endprocedure

//End Merge Pinjam

//Procedure Destroy Semua Data
//Penghancuran/Destroy

procedure Destroy(var Barang : ArrayBarang;var Peminjam : ArrayPeminjam; nPin,nBar : integer);
var
i: integer;
begin
 for i := 1 to nBar do
  begin
   Barang[i].nm_brg := '';
   Barang[i].Kode := '';
   Barang[i].jum := 0;
   if (i <= nPin) then
    begin
     Peminjam[i].nm_peminjam := '';
     Peminjam[i].Kode := '';
     Peminjam[i].jum := 0;
    end; //endif
  end; //endfor
  clrscr;
  gotoxy(49,10);write('Data Berhasil Di Reset');
  gotoxy(55,12);write('Tekan Enter');
  readln;
end; //endfor

//Procedure Cari Data


procedure ItemDicari(var Kode : string);
begin
 clrscr;
 gotoxy(51,5);write('Kode Yang Dicari : ');
 readln(Kode);
end; //endprocedure

//procedure CariBarang
//Searching / Pencarian
procedure CariBarang(Barang : ArrayBarang;Peminjam : ArrayPeminjam; nBar : integer;dicari : string);
var
   i,k : integer;
   ditemukan : boolean;
begin
  ditemukan := false;
  k := 1;
  clrscr;
  gotoxy(28,7);write('=================================================================');
  gotoxy(28,8);write('| No | Nama Barang | Kode Barang | Jumlah | Dipinjam | Tersedia |');
  gotoxy(28,9);write('=================================================================');
  gotoxy(28,9+1);write('|                                                               |');
 for i := 1 to nBar do
  begin
   if(Barang[i].kode = dicari) then
    begin
   gotoxy(28,9+i);write('|    |             |             |        |          |          |');
   gotoxy(28+2,9+i);write(i);
   gotoxy(28+7,9+i);write(Barang[i].nm_brg);
   gotoxy(28+21,9+i);write(Barang[i].kode);
   gotoxy(28+35,9+i);write(Barang[i].jum);
   gotoxy(28+44,9+i);write(Peminjam[i].jum);
   gotoxy(28+55,9+i);write(Barang[i].jum - Peminjam[i].jum);
   k := k+1;
   ditemukan := true;
    end;
  end; //endfor
  gotoxy(28,9+k+1);write('=================================================================');
  if(not ditemukan) then
   begin
    gotoxy(44,9+1);write('Kode Yang Anda Cari tidak Ditemukan');
   end;
  gotoxy(28,9+k+4);write('Tekan Enter untuk keluar!');
  readln;
end; //endprocedure
//End Cari Data

begin
repeat
 clrscr;
 menuUtama(pilih);
 case (pilih) of
 1 : begin
       repeat
        clrscr;
            MenuInputData(Pilihm);
            case (Pilihm) of
            1 : begin
                InputDataBarang(Barang,Nbar);
                end;
            2 : begin
                InputDataPeminjam(Peminjam,Barang, NPin,Nbar);
                end;
            end; //endcase
       until(Pilihm = 0);
    end;

 2 :begin
      repeat
       clrscr;
           menuTampil(piliht);
           case (piliht) of
           1 : begin
               sortbrg(Barang,1,Nbar);
               TampilBarang(Barang,Peminjam,NBar);
               end;
           2 : begin
               sortpeminjam(Peminjam,1,Npin);
               TampilPeminjam(Peminjam,Barang,Npin);
               end;
            end;// End Case
      until(piliht = 0);
    end;
 3 : begin
      sortbrg(Barang,1,Nbar);
      sortpeminjam(Peminjam,1,Npin);
      ItemDicari(KodeDicari);
      CariBarang(Barang,Peminjam,NBar,KodeDicari);
     end;
 4 : begin
      Destroy(Barang,Peminjam,nPin,nBar); //Membersihkan Semua Data
      nPin := 0;
      nBar := 0;
     end;
   end;
until(pilih = 0);
end.
