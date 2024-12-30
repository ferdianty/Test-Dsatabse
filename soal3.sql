
CREATE TABLE Mahasiswa (
    NIM VARCHAR(10) PRIMARY KEY,
    Nama VARCHAR(50),
    Alamat VARCHAR(100),
    Jurusan VARCHAR(50),
    Umur INT
);

INSERT INTO Mahasiswa (NIM, Nama, Alamat, Jurusan, Umur) VALUES
('123456', 'John', 'Jl. Merdeka No. 1', 'Teknik Informatika', 21),
('234567', 'Alice', 'Jl. Gatot Subroto', 'Sistem Informasi', 23),
('345678', 'Bob', 'Jl. Sudirman No. 5', 'Teknik Informatika', 20),
('456789', 'Cindy', 'Jl. Pahlawan No. 2', 'Manajemen', 22),
('567890', 'David', 'Jl. Diponegoro No. 3', 'Teknik Elektro', 25),
('678901', 'Emily', 'Jl. Cendrawasih No. 4', 'Manajemen', 24),
('789012', 'Frank', 'Jl. Ahmad Yani No. 6', 'Teknik Informatika', 19);

CREATE TABLE MataKuliah (
    ID INT PRIMARY KEY,
    MataKuliah VARCHAR(50),
    NIM VARCHAR(10),
    Nilai INT,
    DosenPengajar VARCHAR(50)
);

INSERT INTO MataKuliah (ID, MataKuliah, NIM, Nilai, DosenPengajar) VALUES
(1, 'Pemrograman Web', '123456', 85, 'Pak Budi'),
(2, 'Basis Data', '234567', 70, 'Ibu Ani'),
(3, 'Jaringan Komputer', '345678', 75, 'Pak Dodi'),
(4, 'Sistem Operasi', '123456', 90, 'Pak Budi'),
(5, 'Manajemen Proyek', '456789', 80, 'Ibu Desi'),
(6, 'Bahasa Inggris', '567890', 85, 'Ibu Eka'),
(7, 'Statistika', '678901', 75, 'Pak Farhan'),
(8, 'Algoritma', '789012', 65, 'Pak Galih'),
(9, 'Pemrograman Java', '123456', 95, 'Pak Budi');

/*Update alamat mahasiswa dengan NIM ‘123456’ menjadi ‘Jl. Raya No.5’.*/
UPDATE Mahasiswa
SET Alamat = 'Jl. Raya No.5'
WHERE NIM = '123456';

/*Tampilkan NIM, nama, dan jurusan dari mahasiswa yang memiliki jurusan ‘Teknik Informatika’, serta tampilkan juga nama dosen pembimbingnya.*/
SELECT 
    Mhs.NIM, 
    Mhs.Nama, 
    Mhs.Jurusan, 
    MK.DosenPengajar AS DosenPembimbing
FROM 
    Mahasiswa Mhs
JOIN 
    MataKuliah MK ON Mhs.NIM = MK.NIM
WHERE 
    Mhs.Jurusan = 'Teknik Informatika';

/* Tampilkan 5 nama mahasiswa dengan umur tertua*/
SELECT TOP 5 
    Nama, 
    Umur
FROM 
    Mahasiswa
ORDER BY 
    Umur DESC;


/*Tampilkan nama mahasiswa, mata kuliah yang diambil, dan nilai yang diperoleh untuk setiap mata kuliah. Hanya tampilkan data mahasiswa yang memiliki nilai lebih bagus dari 70.*/
SELECT 
    Mhs.Nama AS NamaMahasiswa, 
    MK.MataKuliah, 
    MK.Nilai
FROM 
    Mahasiswa Mhs
JOIN 
    MataKuliah MK ON Mhs.NIM = MK.NIM
WHERE 
    MK.Nilai > 70;
