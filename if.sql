--
Contoh If
--

SELECT k.NimMhs, 
		m.NamaMhs, 
      k.KodeMk, 
      T.NamaMk, 
      K.NilaiTugas,
      K.NilaiUts,
      K.NilaiUas,
      k.NilaiTugas*j.ProsTugas+K.NilaiUts*j.ProsUts+K.NilaiUas*J.ProsUas as 'Nilai Akhir', 
      if(k.NilaiTugas*j.ProsTugas+K.NilaiUts*j.ProsUts+K.NilaiUas*j.ProsUas<=40,'E',
         if(k.NilaiTugas*j.ProsTugas+K.NilaiUts*j.ProsUts+K.NilaiUas*j.ProsUas<=55,'D',
            if(k.NilaiTugas*j.ProsTugas+K.NilaiUts*j.ProsUts+K.NilaiUas*j.ProsUas<=70,'C',
               if(k.NilaiTugas*j.ProsTugas+K.NilaiUts*j.ProsUts+K.NilaiUas*j.ProsUas<=85,'B','A')))) As 'NIlai Huruf'

FROM khs K, mahasiswa M, matakuliah T, mengajar J
WHERE k.KodeMk=t.KodeMk and 
		k.NimMhs=m.NimMhs and 
      j.KodeMk=k.KodeMk AND 
      k.TahunAjaran=j.TahunAjaran AND
      k.KodeSemester=j.Semester
