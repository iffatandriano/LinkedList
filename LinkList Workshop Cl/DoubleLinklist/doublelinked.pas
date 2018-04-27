program double_linked_list;
uses crt;

type
    point=^node;
    node=record
       info:integer;
       prev,next:point; 
    end;

var
    awal,akhir,baru,bantu:point;
    pilihan,pilih, milih : integer;
    jumlah,nilai, position : integer;

    procedure create;

    begin
        awal:=nil;
        akhir:=nil;
    end;

    procedure addFirst(nilai:integer);

    begin
        new(baru);
        baru^.info:=nilai;
        baru^.prev:=nil;
        if(awal=nil)then
        begin
            baru^.next:=nil;
            akhir:=baru;
        end
        else
        begin
            baru^.next:=awal;
            awal^.prev:=baru;
        end;
        awal:=baru;
    end;

    procedure viewFirstToLast;

	begin
		if(awal=nil)then
			writeln('Maaf, linked list kosong')
		else
		begin
			bantu:=awal;
			while(bantu<>nil)do
			begin
				writeln(bantu^.info);
				bantu:=bantu^.next;
			end;
		end;
        writeln;
	end;

    procedure deleteFirst;

    begin
        if(awal=nil)then
            writeln('Maaf, linkedlist kosong')
        else if(awal=akhir)then
        begin
            bantu:=awal;
            awal:=nil;
            akhir:=nil;
            dispose(bantu);
        end
        else
        begin
            bantu:=awal;
            awal:=bantu^.next;
            awal^.prev:=nil;
            dispose(bantu);
        end;
    end;

    procedure deleteAt(position:integer);
var
        i:integer;

    begin
        i:=1;
        if(awal=nil) then
            begin
    clrscr;            
                write('Data Sudah Kosong !!!!!!');
            end

              else if(position=1) then
              begin
                deleteFirst;
              end
              else
                begin
                bantu:=awal;

            while(i<>position) do
                begin
                bantu := bantu^.next;
                i:= i+1;
                end;
                if(position=i) then
                begin
                            
                if(bantu^.next = nil) then
                begin
                 bantu^.prev^.next := nil;
                 bantu^.prev := nil;
                 dispose(bantu);
                end
                else
                begin
                 bantu^.prev^.next := bantu^.next;
                 bantu^.next^.prev := bantu^.prev;
                 dispose(bantu);
                 end;
            end
        end;
 end;

    procedure insert(position, nilai :integer);
     var
      i:integer;
   
    begin
       i:=1;
        if(awal=nil) then
        begin
            addFirst(nilai);
        end

        else if(position=1) then
        begin
        addFirst(nilai);
        end

        else
          begin
             bantu:=awal;

             while(bantu <> nil) AND (position<>i) do
          begin
            bantu := bantu^.next;
            i :=i+1;
          end;

           if(position=i) then
      begin
        new(baru);
        
        baru^.next := bantu;
        baru^.prev := bantu^.prev;
        bantu^.prev^.next := baru;
        bantu^.prev := baru;
        baru^.info := nilai;
      end

      else if (bantu=nil) then
        begin
    clrscr;      
        writeln('Posisi Tidak Ditemukan');
        end
      else
        begin
    clrscr;
        
        writeln('Data Tidak Ditemukan')
        end;
        end;
       end;
    procedure addSortAsc(nilai:integer);
        //menambahkan data pada double linkedlist sekaligus mengurutkan 
        //data di dalamnya secara ascending menggunakan bubble sort
    var 
        bantu2: point;
        sem: integer;
    begin
        addFirst(nilai);
        if(awal <> nil) then
        begin
            bantu := awal;
            while(bantu <> akhir) do
            begin
                bantu2 := akhir;
                while(bantu2 <> bantu) do
                begin
                    if(bantu2^.Info <= bantu2^.prev^.info) then
                    begin
                        sem := bantu2^.prev^.info;
                        bantu2^.prev^.info := bantu2^.info;
                        bantu2^.info := sem;
                    end;    
                    bantu2 := bantu2^.prev;
                end;
                bantu := bantu^.next;
            end;
        end
        else 
        begin
            write('Data masih kosong!');
            readln;
        end;
    end;

    procedure menuDataAdd(var pilih : integer);
    var
     jumlah, i, nilai, position : integer;

    begin
     clrscr;
      textcolor(15);
      gotoxy(54,10);writeln('MENU PILIHAN ADD');
      gotoxy(54,11);writeln('----------------');
      gotoxy(43,13);writeln('1. Tambah Depan');
      gotoxy(43,14);writeln('2. Tambah Posisi & Tampil');
      gotoxy(43,15);writeln('0. exit');
      gotoxy(43,18);write('Pilihan Anda ? '); readln(pilih);

      while (pilih > 2) or (pilih < 0) do
      begin
        write('Menu Pilihan Hanya 1/2/3/0, Ulangi!');
        readln(pilih);
      end;
    end;

    procedure tambahDepan(jumlah, nilai : integer);
    var
     i : integer;
     position : integer;
    begin
      clrscr;
      write('Masukkan Jumlah Data : '); readln(jumlah);
       for i := 1 to jumlah do
       begin
        write('Masukkan Angka ke-',i,' : '); readln(nilai);
        addFirst(nilai);
       end;
    end;

    procedure tampilPosisi(nilai, position : integer);
    begin
      write('Masukkan Nilai : '); readln(nilai);
      write('Masukkan Posisi : '); readln(position);
    begin
     write('Masukkan nilai : '); readln(nilai);
     addSortAsc(nilai);
    end;
     viewFirstToLast;
    end;

    procedure hapusDepan (position : integer);
    begin
      write('Urutan Data Yang Ingin Dihapus : '); readln(position);
      DeleteAt(position);
      writeln('Data yang Sudah Dihapus : ');
      viewFirstToLast;
    end;


    procedure menuPilihan(var pilihan:integer);
    begin
        //isi dengan perintah untuk membuat menu yang berisi daftar 
        //operasi struktur data pada double linked list
       textcolor(15);
       gotoxy(54,10);writeln('Menu Pilihan');
       gotoxy(54,11);writeln('------------');
       gotoxy(43,13);writeln('1. Tambah Data ');
       gotoxy(43,14);writeln('2. Hapus Data');
       gotoxy(43,15);writeln('0. Exit');
       gotoxy(43,18);write('Pilihan Anda ? '); readln(pilihan);

       while (pilihan > 2) or (pilihan < 0) do
       begin
        write('Menu Pilihan Hanya 1/2/0, Ulangi!');
        readln(pilihan);    
       end; 
    end;

begin
 repeat;
  clrscr;
  menuPilihan(pilihan);
  case (pilihan) of
    1 : begin
        repeat
        clrscr;
        menuDataAdd(pilih);
        case (pilih) of
        1 : begin
            tambahDepan(jumlah,nilai);
            readln;
            end;
        2 : begin
            clrscr;
            tampilPosisi(nilai,position);
            readln;
            end;
        end; //endcase
        until (pilih = 0);
        end;  
    2 : begin
        clrscr;
        hapusDepan(position);
        readln;
        end;
    0 : begin
        exit
        end;        
  end; //endcase
 until(pilihan = 0); 
    //create;
    //addFirst(1);
    //addFirst(2);
    //addFirst(3);
    //viewFirstToLast;
    //deleteFirst;
    //viewFirstToLast;
end.
