import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final namaController = TextEditingController();
  final ttlController = TextEditingController();
  final jkController = TextEditingController();
  final alamatController = TextEditingController();
  final agamaController = TextEditingController();
  final pendidikanController = TextEditingController();
  final hpController = TextEditingController();
  final emailController = TextEditingController();

  Widget buildField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.deepPurple),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Colors.deepPurple,
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
      appBar: AppBar(
        title: const Text("Input Data Diri"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Silakan lengkapi data profil Anda di bawah ini :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildField(
              label: "Nama Lengkap",
              icon: Icons.person,
              controller: namaController,
            ),
            buildField(
              label: "Tempat/Tgl Lahir",
              icon: Icons.calendar_month,
              controller: ttlController,
            ),
            buildField(
              label: "Jenis Kelamin",
              icon: Icons.people,
              controller: jkController,
            ),
            buildField(
              label: "Alamat",
              icon: Icons.home,
              controller: alamatController,
            ),
            buildField(
              label: "Agama",
              icon: Icons.favorite,
              controller: agamaController,
            ),
            buildField(
              label: "Pendidikan",
              icon: Icons.school,
              controller: pendidikanController,
            ),
            buildField(
              label: "No. HP/WA",
              icon: Icons.phone,
              controller: hpController,
            ),
            buildField(
              label: "Email",
              icon: Icons.email,
              controller: emailController,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        nama: namaController.text,
                        ttl: ttlController.text,
                        jk: jkController.text,
                        alamat: alamatController.text,
                        agama: agamaController.text,
                        pendidikan: pendidikanController.text,
                        hp: hpController.text,
                        email: emailController.text,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Lihat Profil",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String nama;
  final String ttl;
  final String jk;
  final String alamat;
  final String agama;
  final String pendidikan;
  final String hp;
  final String email;

  const ProfilePage({
    super.key,
    required this.nama,
    required this.ttl,
    required this.jk,
    required this.alamat,
    required this.agama,
    required this.pendidikan,
    required this.hp,
    required this.email,
  });

  Widget buildItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.deepPurple,
            size: 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(height: 25),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  nama,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  pendidikan,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildItem(
                      icon: Icons.calendar_month,
                      title: "Tempat/Tgl Lahir",
                      value: ttl,
                    ),
                    buildItem(
                      icon: Icons.people,
                      title: "Jenis Kelamin",
                      value: jk,
                    ),
                    buildItem(
                      icon: Icons.home,
                      title: "Alamat",
                      value: alamat,
                    ),
                    buildItem(
                      icon: Icons.favorite,
                      title: "Agama",
                      value: agama,
                    ),
                    buildItem(
                      icon: Icons.phone,
                      title: "No. HP/WA",
                      value: hp,
                    ),
                    buildItem(
                      icon: Icons.email,
                      title: "Email",
                      value: email,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}