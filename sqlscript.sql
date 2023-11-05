REM   Script: Modul 2 SBD
REM   Latihan Modul 2 Praktikum

create table customer ( 
    ID_customer char(6) primary key,  
    Nama_customer varchar(100)  
);

create table Pegawai( 
    NIK char(16) primary key, 
    Nama_pegawai varchar(100), 
    Jenis_kelamin char(1), 
    Email varchar(50), 
    Umur int 
);

create table  Transaksi( 
    ID_transaksi char(10) primary key, 
    Tanggal_transaksi date, 
    Metode_pembayaran varchar(15), 
    ID_customer char(6), 
    NIK char(16), 
    foreign key (ID_customer) references Customer(ID_customer), 
    foreign key (NIK) references Pegawai (NIK)     
);

create table Menu_minuman( 
    ID_minuman char(6) primary key, 
    Nama_minuman varchar(50), 
    Harga_minuman float(2) 
);

create table Telepon( 
    No_telp_pegawai varchar(15) primary key, 
    NIK char(16), 
    foreign key (NIK) References Pegawai(NIK) 
);

create table Transaksi_minuman( 
    ID_minuman char(6), 
    ID_transaksi char(10), 
    Jumlah_cup int, 
    foreign key (ID_minuman) references Menu_minuman(ID_minuman), 
    foreign key (ID_transaksi) references Transaksi(ID_transaksi)     
) ;

create table Membership( 
    ID_membership char(6), 
    No_telp_customer varchar(15), 
    alamat_customer VARCHAR(100), 
    tanggal_pembuatan_kartu_membership DATE, 
    tanggal_kadaluwarsa_kartu_membership DATE null, 
    total_poin INT, 
    ID_customer CHAR(6) 
);

ALTER TABLE Membership 
add CONSTRAINT ID_customer 
FOREIGN KEY (ID_customer) REFERENCES Customer(ID_customer) ;

ALTER TABLE Membership  
    MODIFY tanggal_pembuatan_kartu_membership DEFAULT SYSDATE;

ALTER TABLE Membership  
    ADD CONSTRAINT chk_total_poin CHECK (total_poin >= 0);

ALTER TABLE Membership  
    MODIFY alamat_customer VARCHAR2(150);

DROP TABLE Telepon;

ALTER TABLE Pegawai ADD No_telp_pegawai VARCHAR2(15);

INSERT INTO Customer (ID_customer, Nama_customer) VALUES ('CTR001', 'Budi Santoso');

INSERT INTO Customer (ID_customer, Nama_customer) VALUES ('CTR002', 'Sisil Triana');

INSERT INTO Customer (ID_customer, Nama_customer) VALUES ('CTR003', 'Davi Liam');

INSERT INTO Customer (ID_customer, Nama_customer) VALUES ('CTRo04', 'Sutris Ten An');

INSERT INTO Customer (ID_customer, Nama_customer) VALUES ('CTR005', 'Hendra Asto');

INSERT INTO Membership (ID_membership, no_telp_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kadaluwarsa_kartu_membership, total_poin, ID_customer) VALUES('MBR001', '08123456789', 'Jl. Imam Bonjol', TO_DATE('24-10-2023', 'DD-MM-YYYY'), TO_DATE('30-11-2023', 'DD-MM-YYYY'), 0, 'CTR001');

INSERT INTO Membership (ID_membership, no_telp_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kadaluwarsa_kartu_membership, total_poin, ID_customer) VALUES('MBR002', '0812345678', 'Jl. Kelinci', TO_DATE('24-10-2023', 'DD-MM-YYYY'), TO_DATE('30-11-2023', 'DD-MM-YYYY'), 3, 'CTR002');

INSERT INTO Membership (ID_membership, no_telp_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kadaluwarsa_kartu_membership, total_poin, ID_customer) VALUES('MBR003', '081234567890', 'Jl. Abah Ojak', TO_DATE('25-10-2023', 'DD-MM-YYYY'), TO_DATE('1-12-2023', 'DD-MM-YYYY'), 2, 'CTR003');

INSERT INTO Membership (ID_membership, no_telp_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kadaluwarsa_kartu_membership, total_poin, ID_customer) VALUES('MBR004', '08987654321', 'Jl. Kenangan', TO_DATE('26-10-2023', 'DD-MM-YYYY'), TO_DATE('2-12-2023', 'DD-MM-YYYY'), 6, 'CTR005');

INSERT INTO Pegawai (NIK, Nama_pegawai, Jenis_kelamin, Email, Umur, No_telp_pegawai) VALUES ('1234567890123456', 'Naufal Raf', 'L', 'naufal@gmail.com', 19, '62123456789');

INSERT INTO Pegawai (NIK, Nama_pegawai, Jenis_kelamin, Email, Umur, No_telp_pegawai) VALUES ('2345678901234561', 'Surinala', 'P', 'surinala@gmail.com', 24, '621234567890');

INSERT INTO Pegawai (NIK, Nama_pegawai, Jenis_kelamin, Email, Umur, No_telp_pegawai) VALUES ('3456789012345612', 'Ben John', 'L', 'benjohn@gmail.com', 22, '6212345678');

INSERT INTO Transaksi (ID_Transaksi, Tanggal_Transaksi, Metode_Pembayaran, NIK, ID_customer) VALUES ('TRX0000001', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Kartu kredit', '2345678901234561', 'CTR002');

INSERT INTO Transaksi (ID_Transaksi, Tanggal_Transaksi, Metode_Pembayaran, NIK, ID_customer) VALUES ('TRX0000002', TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'Transfer bank', '3456789012345612', 'CTRo04');

INSERT INTO Transaksi (ID_Transaksi, Tanggal_Transaksi, Metode_Pembayaran, NIK, ID_customer) VALUES ('TRX0000003', TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'Tunai', '3456789012345612', 'CTR001');

INSERT INTO Transaksi (ID_Transaksi, Tanggal_Transaksi, Metode_Pembayaran, NIK, ID_customer) VALUES ('TRX0000004', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'Kartu debit', '1234567890123456', 'CTR003');

INSERT INTO Transaksi (ID_Transaksi, Tanggal_Transaksi, Metode_Pembayaran, NIK, ID_customer) VALUES ('TRX0000005', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'E-wallet', '1234567890123456', 'CTRo04');

INSERT INTO Transaksi (ID_Transaksi, Tanggal_Transaksi, Metode_Pembayaran, NIK, ID_customer) VALUES ('TRX0000006', TO_DATE('2023-10-21', 'YYYY-MM-DD'), 'Tunai', '2345678901234561', 'CTR001');

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM001', 'Espresso', 18000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM002', 'Cappuccino', 20000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM003', 'Latte', 21000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM004', 'Americano', 19000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM005', 'Mocha', 22000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM006', 'Macchiato', 23000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM007', 'Cold Brew', 21000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM008', 'Iced Coffee', 18000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM009', 'Affogato', 23000);

INSERT INTO Menu_minuman (ID_Minuman, Nama_Minuman, Harga_Minuman) VALUES ('MNM010', 'Coffee Frappe', 22000);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_minuman, Jumlah_cup) VALUES ('TRX0000005', 'MNM006', 2);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000001', 'MNM010', 1);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000002', 'MNM005', 1);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000005', 'MNM009', 1);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000003', 'MNM001', 3);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000006', 'MNM003', 2);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000004', 'MNM004', 2);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000004', 'MNM010', 1);

INSERT INTO Transaksi_Minuman (ID_transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000002', 'MNM003', 2);

INSERT INTO Transaksi_Minuman (ID_Transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000001', 'MNM007', 1);

INSERT INTO Transaksi_Minuman (ID_Transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000005', 'MNM001', 1);

INSERT INTO Transaksi_Minuman (ID_Transaksi, ID_Minuman, jumlah_cup) VALUES ('TRX0000003', 'MNM003', 1);

INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_Pembayaran, NIK, ID_customer) 
VALUES ('TRX0000007', TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'Transfer bank', '2345678901234561', 'CTRo04');

INSERT INTO Transaksi_Minuman (ID_Transaksi, ID_Minuman, jumlah_cup) 
VALUES ('TRX0000007', 'MNM005', 1);

INSERT INTO Pegawai (NIK, Nama_pegawai, Umur) 
VALUES ('1111222233334444', 'Maimunah', 25);

UPDATE Pegawai 
SET Jenis_kelamin = 'P', no_telp_pegawai = '621234567', Email = 'maimunah@gmail.com' 
WHERE NIK = '1111222233334444';

UPDATE Membership 
SET Total_poin = 0 
WHERE Tanggal_kadaluwarsa_kartu_membership < to_date('2023-12-01', 'yyyy-mm-dd');

DELETE FROM Membership;

DELETE FROM Pegawai WHERE Nama_pegawai = 'Maimunah';

