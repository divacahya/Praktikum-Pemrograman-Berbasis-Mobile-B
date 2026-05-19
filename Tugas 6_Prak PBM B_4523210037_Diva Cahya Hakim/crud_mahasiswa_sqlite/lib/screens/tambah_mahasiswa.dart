import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class TambahMahasiswa extends StatefulWidget {
  const TambahMahasiswa({super.key});

  @override
  State<TambahMahasiswa> createState() =>
      _TambahMahasiswaState();
}

class _TambahMahasiswaState
    extends State<TambahMahasiswa> {

  final nama = TextEditingController();
  final ttl = TextEditingController();
  final jk = TextEditingController();
  final alamat = TextEditingController();
  final agama = TextEditingController();
  final pendidikan = TextEditingController();
  final nohp = TextEditingController();
  final email = TextEditingController();

  void simpanData() async {

    await DatabaseHelper.instance.insertMahasiswa({
      'nama': nama.text,
      'ttl': ttl.text,
      'jenisKelamin': jk.text,
      'alamat': alamat.text,
      'agama': agama.text,
      'pendidikan': pendidikan.text,
      'noHp': nohp.text,
      'email': email.text,
    });

    Navigator.pop(context);
  }

  Widget buildTextField(
    String hint,
    TextEditingController controller,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          hintText: hint,

          hintStyle: const TextStyle(
            color: Colors.grey,
          ),

          prefixIcon: Icon(
            icon,
            color: const Color(0xffF8AFCB),
          ),

          filled: true,
          fillColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(
              color: Color(0xffF8AFCB),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffFFF6FB),

      appBar: AppBar(
        backgroundColor: const Color(0xffF8AFCB),
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Tambah Mahasiswa",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // BUTTON BAWAH
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),

        child: SizedBox(
          width: double.infinity,
          height: 58,

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
              const Color(0xffF8AFCB),

              elevation: 0,

              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20),
              ),
            ),

            onPressed: simpanData,

            child: const Text(
              "Tambah",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 10),

              const Text(
                "Isi Data Mahasiswa 🎀",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1E1E1E),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Tambahkan data mahasiswa baru",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              buildTextField(
                "Nama",
                nama,
                Icons.person_rounded,
              ),

              buildTextField(
                "Tempat, Tanggal Lahir",
                ttl,
                Icons.calendar_month_rounded,
              ),

              buildTextField(
                "Jenis Kelamin",
                jk,
                Icons.people_alt_rounded,
              ),

              buildTextField(
                "Alamat",
                alamat,
                Icons.home_rounded,
              ),

              buildTextField(
                "Agama",
                agama,
                Icons.favorite_rounded,
              ),

              buildTextField(
                "Pendidikan",
                pendidikan,
                Icons.school_rounded,
              ),

              buildTextField(
                "Nomor HP",
                nohp,
                Icons.phone_rounded,
              ),

              buildTextField(
                "Email",
                email,
                Icons.email_rounded,
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}