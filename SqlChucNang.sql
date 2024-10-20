--DauSach 
Create View View_DauSach as
Select* From DauSach

Create Proc Proc_ThemDauSach 
@MaDS nvarchar(10),
@Ten nvarchar(100), 
@TheLoai nvarchar(50),
@MaTG varchar(10),
@MaNXB varchar(10)
as
Begin
Insert into DauSach(MaDS,Ten,TheLoai,MaTG,MaNXB) values (@MaDS,@Ten,@TheLoai,@MaTG,@MaNXB)
end

Create Proc Proc_XoaDauSach 
@MaDS nvarchar(10)
as
Begin
Delete from DauSach Where MaDS=@MaDS
end

CREATE PROCEDURE Proc_SuaDauSach
    @MaDS nvarchar(10),
    @Ten nvarchar(100), 
    @TheLoai nvarchar(50),
    @MaTG varchar(10),
    @MaNXB varchar(10)
AS
BEGIN
UPDATE DauSach
SET 
Ten = @Ten,
TheLoai = @TheLoai,
MaTG = @MaTG,
MaNXB = @MaNXB
WHERE MaDS = @MaDS;
END;
--Nha Xuat Ban
CREATE VIEW View_NhaXuatBan AS 
SELECT * 
FROM  dbo.NhaXuatBan

CREATE PROCEDURE Proc_ThemNhaXuatBan
	@MaNXB VARCHAR(10),      
    @Ten NVARCHAR(100),         
    @DiaChi NVARCHAR(255),      
    @Email VARCHAR(100),         
    @Sdt VARCHAR(10)
AS
BEGIN
	INSERT INTO NhaXuatBan (MaNXB, Ten, DiaChi, Email, Sdt)
	VALUES (@MaNXB, @Ten, @DiaChi, @Email, @Sdt)
END

CREATE PROCEDURE Proc_XoaNhaXuatBan
	@MaNXB VARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.NhaXuatBan WHERE NhaXuatBan.MaNXB = @MaNXB
END

CREATE PROCEDURE Proc_SuaNhaXuaBan
	@MaNXB VARCHAR(10),      
    @Ten NVARCHAR(100),         
    @DiaChi NVARCHAR(255),      
    @Email VARCHAR(100),         
    @Sdt VARCHAR(10)
AS
BEGIN
	UPDATE dbo.NhaXuatBan SET 
	Ten = @Ten,
	DiaChi = @DiaChi, 
	Email = @Email, 
	Sdt = @Sdt
	WHERE MaNXB = @MaNXB
END
--Doc Gia
Create View View_DocGia as
Select* From DocGia;

Create Procedure Proc_ThemDocGia
     @MaDG NVARCHAR(10),
     @GioiTinh NVARCHAR(10),
     @Ten NVARCHAR(100),
     @DiaChi NVARCHAR(255),
     @Email NVARCHAR(100),
     @Sdt NVARCHAR(10),
     @NgaySinh DATE
As
Begin 
     Insert Into DocGia(MaDG,GioiTinh,Ten,DiaChi,Email,Sdt,NgaySinh)	
	 Values(@MaDG,@GioiTinh,@Ten,@DiaChi,@Email,@Sdt,@NgaySinh);
end;


Create Procedure Proc_XoaDocGia
      @MaDG NVARCHAR(10)
as
Begin
      Delete From DocGia
	  where MaDG = @MaDG;
end;

Create Procedure Proc_SuaDocGia
     @MaDG NVARCHAR(10),
     @GioiTinh NVARCHAR(10),
     @Ten NVARCHAR(100),
     @DiaChi NVARCHAR(255),
     @Email NVARCHAR(100),
     @Sdt NVARCHAR(10),
     @NgaySinh DATE
as
Begin
      Update DocGia
	  Set
	  GioiTinh = @GioiTinh,
	  Ten = @Ten,
	  DiaChi = @DiaChi,
	  Email =@Email,
	  Sdt =@Sdt,
	  NgaySinh =@NgaySinh
	  Where MaDG =@MaDG;
end;
--ViTri
CREATE VIEW View_ViTri AS 
SELECT *  
FROM ViTri

Create PROC Proc_ThemViTri
@MaVT nvarchar(10),
@KhuVuc nvarchar(20),
@Ke nvarchar(20),
@Ngan nvarchar(20)
as
begin
insert into ViTri(MaVT,Ke,KhuVuc,Ngan) values (@MaVT, @Ke, @KhuVuc, @Ngan);
end;

Create proc Proc_XoaViTri
@MaVT nvarchar(10)
as
begin
DELETE FROM ViTri WHERE MaVT = @MaVT;
end;

create proc Proc_SuaViTri
@MaVT nvarchar(10),
@KhuVuc nvarchar(20),
@Ke nvarchar(20),
@Ngan nvarchar(20)
as
begin
UPDATE ViTri
            SET KhuVuc = @KhuVuc,
                Ke = @Ke,
                Ngan = @Ngan
            WHERE MaVT = @MaVT;
end;
CREATE PROC Proc_TimKiemViTri
@MaVT nvarchar(10)
AS
BEGIN
    SELECT *
    FROM ViTri
    WHERE MaVT = @MaVT;
END;

--TacGia
Create View View_TacGia as
Select* From TacGia;

Create Procedure Proc_ThemTacGia
     @MaTG NVARCHAR(10),
     @Ten NVARCHAR(100),
     @Email NVARCHAR(100),
     @Sdt NVARCHAR(10)
As
Begin 
     Insert Into TacGia(MaTG,Ten,Email,Sdt)	
	 Values(@MaTG,@Ten,@Email,@Sdt);
end;

Create Procedure Proc_XoaTacGia
      @MaTG NVARCHAR(10)
as
Begin
      Delete From TacGia
	  where MaTG = @MaTG;
end;

Create Procedure Proc_SuaTacGia
     @MaTG NVARCHAR(50),  
     @Ten NVARCHAR(100),   
     @Email NVARCHAR(100),
     @Sdt NVARCHAR(20)
as
Begin
      Update TacGia
	  Set 
	  Ten = @Ten,	 
	  Email =@Email,
	  Sdt =@Sdt
	  Where MaTG =@MaTG;
end;
--CuonSach
CREATE VIEW View_ThongTinCuonSach AS
SELECT 
    cs.MaCS,                  
    ds.MaDS,                  
    vt.MaVT,                   
    ds.Ten AS TenDauSach,      
    nxb.Ten AS NhaXuatBan,      
    tg.Ten AS TacGia            
FROM 
    CuonSach cs
JOIN 
    DauSach ds ON cs.MaDS = ds.MaDS         
LEFT JOIN 
    NhaXuatBan nxb ON ds.MaNXB = nxb.MaNXB  
LEFT JOIN 
    TacGia tg ON ds.MaTG = tg.MaTG          
LEFT JOIN 
    ViTri vt ON cs.MaVT = vt.MaVT          
    

Create Procedure Proc_ThemCuonSach
     @MaCS NVARCHAR(10),
     @MaDS NVARCHAR(10),
     @MaVT NVARCHAR(10)   
As
Begin 
     Insert Into CuonSach(MaCS,MaDS,MaVT)
	 Values(@MaCS,@MaDS,@MaVT);
end;

Create Procedure Proc_XoaCuonSach
      @MaCS NVARCHAR(10)
as
Begin
      Delete From CuonSach
	  where MaCS = @MaCS;
end;

Create Procedure Proc_SuaCuonSach
     @MaCS NVARCHAR(10),
     @MaDS NVARCHAR(10),
     @MaVT NVARCHAR(10)   
As
begin
Update CuonSach
	  Set 
		MaDS = @MaDS,
		MaVT = @MaVT
	 Where MaCS = @MaCS;
end;


