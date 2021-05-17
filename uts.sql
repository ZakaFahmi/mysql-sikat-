Mahasiswa yang tidak memrogram matakuliah di tah '20152016' semester '1'
SELECT DISTINCT(m.NimMhs), 
		m.NamaMhs 
	FROM mahasiswa m 
	LEFT OUTER JOIN krs k
	ON m.NimMhs=k.NimMhs
	WHERE k.NimMhs IS NULL and 
  	k.TahunAjaran='20152016' AND 
      k.KodeSemester='1'

SELECT DISTINCT(m.NimMhs), 
		m.NamaMhs 
	FROM krs k 
	LEFT OUTER JOIN mahasiswa m
	ON m.NimMhs=k.NimMhs
	WHERE k.NimMhs IS NULL and 
  	k.TahunAjaran='20152016' AND 
      k.KodeSemester='1'

Dosen yang tidak menjadi dosen wali
#cara 1
SELECT dosen.NipDosen, dosen.NamaDosen 
	FROM dosen 
	LEFT OUTER JOIN perwalian
	ON dosen.NipDosen=perwalian.NipDosen
	WHERE perwalian.NipDosen IS NULL

#cara 2
SELECT d.NipDosen, d.NamaDosen
FROM dosen d
WHERE d.NipDosen not in (
  	SELECT p.NipDosen
  	FROM perwalian p
	)

DOsen yang menjadi dosen wali
#cara 1
SELECT DISTINCT(p.NipDosen), d.NamaDosen
FROM perwalian p, dosen d
WHERE p.NipDosen=d.NipDosen

#cara 2
SELECT d.NipDosen, d.NamaDosen
FROM dosen d
WHERE d.NipDosen in (
  	SELECT p.NipDosen
  	FROM perwalian p
	)

Peserta matakukiah tahun ajaran 20152016 semester gasal
# Cara 1
SELECT k.KodeMk, m.NamaMk, COUNT(k.KodeMk)
FROM krs k, matakuliah m
WHERE k.KodeMk=m.KodeMk and k.TahunAjaran='20152016' and k.KodeSemester='1'
GROUP BY k.KodeMk

#cara 2
SELECT m.NimMhs, m.NamaMhs
FROM mahasiswa m
WHERE m.NimMhs in (
  	SELECT NimMhs
  	FROM KRS
  	where krs.TahunAjaran='20152016' AND
  	  krs.KodeSemester='1'	
  )

Jumlah kelurahan tiap kecamatan
SELECT k.KodeKec, c.NamaKec, COUNT(k.KodeKel)
FROM kelurahan k, kecamatan c
WHERE k.KodeKec=c.KodeKec
GROUP BY k.KodeKec
