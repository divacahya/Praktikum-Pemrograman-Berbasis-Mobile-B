import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'tambah_mahasiswa.dart';
import 'edit_mahasiswa.dart';
import 'detail_mahasiswa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String, dynamic>> mahasiswa = [];

  void getData() async {
    final data = await DatabaseHelper.instance.getMahasiswa();

    setState(() {
      mahasiswa = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Mahasiswa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18),

        child: ListView.builder(
          itemCount: mahasiswa.length,

          itemBuilder: (context, index) {

            final data = mahasiswa[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 15),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: ListTile(
                contentPadding: const EdgeInsets.all(16),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailMahasiswa(data: data),
                    ),
                  );
                },

                leading: const CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xffF1EEFF),

                  child: Icon(
                    Icons.person,
                    color: Color(0xffF8AFCB),
                  ),
                ),

                title: Text(
                  data['nama'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(data['pendidikan']),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    IconButton(
                      icon: const Icon(
                        Icons.edit_rounded,
                        color: Colors.orange,
                      ),

                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                EditMahasiswa(data: data),
                          ),
                        );

                        getData();
                      },
                    ),

                    IconButton(
                      icon: const Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                      ),

                      onPressed: () async {
                        await DatabaseHelper.instance
                            .deleteMahasiswa(data['id']);

                        getData();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
              const TambahMahasiswa(),
            ),
          );

          getData();
        },
      ),
    );
  }
}