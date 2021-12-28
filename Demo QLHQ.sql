create database QLHQ

use QLHQ
go


create table  NhaCungCap
(
ID int identity(1,1) primary key,
TenNCC nvarchar(50) not null,
DiaChi nvarchar(50),
SDT char(13),
Web varchar(50),
DatTieuChuan int
)


create table KhachHang
(
ID int identity(1,1) primary key,
HoTen nvarchar(50) not null,
GioiTinh nvarchar(5), 
check
	(GioiTinh=N'Nam' and 
	GioiTinh=N'Nữ' and 
	GioiTinh='nam' and 
	GioiTinh=N'nữ'),
DiaChi nvarchar(50),
SDT char(13)
)

create table CuaHang
(
ID int identity(1,1) primary key,
TenCH nvarchar(50) not null,
DiaChi nvarchar(50) not null,
SDT char(13) not null,
ThuNhap int default(0)
)

create table NhanVien
(
ID int identity(1,1) primary key,
HoTen nvarchar(50) not null,
ChucVu nvarchar(20) not null,
check (ChucVu=N'Nhân viên' and ChucVu=N'Quản lý'),
NgaySinh date,
GioiTinh nvarchar(5), 
check
	(GioiTinh=N'Nam' and 
	GioiTinh=N'Nữ' and 
	GioiTinh='nam' and 
	GioiTinh=N'nữ'),
NgayBatDauLam date,
DiaChi nvarchar(50),
IDCuaHang int not null,
foreign key (IDCuaHang) references CuaHang(ID)
)

create table Shipper
(
ID int identity(1,1) primary key,
HoTen nvarchar(50) not null,
NgaySinh date,
GioiTinh nvarchar(5), 
check
	(GioiTinh=N'Nam' and 
	GioiTinh=N'Nữ' and 
	GioiTinh='nam' and 
	GioiTinh=N'nữ'),
DiaChi nvarchar(50),
BienSoXe char(10) 
)




--có 2 loại quả Quả khô: Vỏ quả khi chin: khô, cứng, mỏng.  Quả thịt :Vỏ quả khi chin: mềm, dày, chứa đầy thịt quả.
create table LoaiQua
(
ID int identity( 1,1) primary key,
TenLoai nvarchar(50) not null,
MoTa nvarchar(50) not null
)



create table Qua
(
ID int identity(1,1) primary key,
TenQua nvarchar(50) not null,
IDNCC int not null,
IDLoai int not null,
Gia int not null,
GiaTraiMua int ,
SoLuong int not null,
MoTa nvarchar(50),
NgungBan int not null,
check(NgungBan=1 and NgungBan=0),
foreign key (IDNCC) references NhaCungCap(ID),
foreign key (IDLoai) references LoaiQua(ID)
)


create table HoaDon
(
ID int identity(1,1) primary key,
IDKhach int not null,
IDCuaHang int not null,
NgayDat date,--not null
PhuongThucThanhToan Char(10),
NgayYeuCauGiao date,
IDShipper int,
DiaChiGiao nvarchar(50),
foreign key (IDShipper) references Shipper(ID),
foreign key (IDKhach) references KhachHang(ID),
foreign key (IDCuaHang) references CuaHang(ID)
)



Create table Qua_HoaDon
(
IDHD int not null,
IDQua int not null,
SoLuong int,
DonGiaBan int,
MaGiamGia char(3) default(0),
primary key(IDHD,IDQua),
foreign key (IDHD) references HoaDon(ID),
foreign key (IDQua) references Qua(ID)
)

drop table NhanVien
drop table HoaDon
drop table Qua
drop table Qua_HoaDon





 



