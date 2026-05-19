import 'package:flutter/material.dart';

class DetailMahasiswa extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailMahasiswa({
    super.key,
    required this.data,
  });

  Widget buildInfo(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: const Color(0xffF1EEFF),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Icon(
              icon,
              color: Color(0xffF8AFCB),
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),

      body: Stack(
        children: [

          // BACKGROUND
          Container(
            height: 210,

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffF8AFCB),
                  Color(0xffF8AFCB),
                ],

                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),

                child: Column(
                  children: [

                    // APPBAR
                    Row(
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(14),
                          ),

                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },

                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),

                        const Expanded(
                          child: Center(
                            child: Text(
                              "Profil Mahasiswa",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 48),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // PROFILE CARD
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [

                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xffF8AFCB),
                                width: 3,
                              ),
                            ),

                            child: const CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xffF1EEFF),

                              child: Icon(
                                Icons.person,
                                size: 45,
                                color: Color(0xffF8AFCB),
                              ),
                            ),
                          ),

                          const SizedBox(height: 14),

                          Text(
                            data['nama'],
                            textAlign: TextAlign.center,

                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1E1E1E),
                            ),
                          ),

                          const SizedBox(height: 6),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              color: const Color(0xffF1EEFF),
                              borderRadius: BorderRadius.circular(30),
                            ),

                            child: Text(
                              data['pendidikan'],
                              style: const TextStyle(
                                color: Color(0xffF8AFCB),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    buildInfo(
                      Icons.calendar_month_rounded,
                      "Tempat, Tanggal Lahir",
                      data['ttl'],
                    ),

                    buildInfo(
                      Icons.people_alt_rounded,
                      "Jenis Kelamin",
                      data['jenisKelamin'],
                    ),

                    buildInfo(
                      Icons.home_rounded,
                      "Alamat",
                      data['alamat'],
                    ),

                    buildInfo(
                      Icons.favorite_rounded,
                      "Agama",
                      data['agama'],
                    ),

                    buildInfo(
                      Icons.phone_rounded,
                      "Nomor HP",
                      data['noHp'],
                    ),

                    buildInfo(
                      Icons.email_rounded,
                      "Email",
                      data['email'],
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