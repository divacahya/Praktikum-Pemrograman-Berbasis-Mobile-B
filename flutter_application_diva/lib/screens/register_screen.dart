import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {

  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  Future<void> register() async {

    if (namaController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Semua field harus diisi",
          ),
        ),
      );

      return;
    }

    if (passwordController.text !=
        confirmPasswordController.text) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Konfirmasi password tidak sesuai",
          ),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {

      QuerySnapshot existingUser =
          await FirebaseFirestore.instance
              .collection('users')
              .where(
                'email',
                isEqualTo:
                    emailController.text.trim(),
              )
              .get();

      if (existingUser.docs.isNotEmpty) {

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              "Email sudah digunakan",
            ),
          ),
        );

        setState(() {
          isLoading = false;
        });

        return;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .add({

        'namaLengkap':
            namaController.text.trim(),

        'email':
            emailController.text.trim(),

        'password':
            passwordController.text,
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Registrasi berhasil",
          ),
        ),
      );

      Navigator.pop(context);

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            "Terjadi kesalahan: $e",
          ),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F6FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 25,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 20),

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Buat Akun Baru",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 35),

                TextField(
                  controller:
                      namaController,

                  decoration: InputDecoration(
                    hintText:
                        "Nama Lengkap",

                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),

                      borderSide:
                          const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller:
                      emailController,

                  decoration: InputDecoration(
                    hintText:
                        "Email/No. Hp",

                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),

                      borderSide:
                          const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller:
                      passwordController,

                  obscureText:
                      !isPasswordVisible,

                  decoration: InputDecoration(
                    hintText:
                        "Password",

                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),

                    suffixIcon:
                        IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: () {

                        setState(() {

                          isPasswordVisible =
                              !isPasswordVisible;
                        });
                      },
                    ),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),

                      borderSide:
                          const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller:
                      confirmPasswordController,

                  obscureText:
                      !isConfirmPasswordVisible,

                  decoration: InputDecoration(
                    hintText:
                        "Konfirmasi Password",

                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),

                    suffixIcon:
                        IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: () {

                        setState(() {

                          isConfirmPasswordVisible =
                              !isConfirmPasswordVisible;
                        });
                      },
                    ),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),

                      borderSide:
                          const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 45),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed:
                        isLoading
                            ? null
                            : register,

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(
                        0xFFC7D2FE,
                      ),

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),

                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: GestureDetector(
                    onTap: () {

                      Navigator.pop(context);
                    },

                    child: RichText(
                      text: const TextSpan(
                        children: [

                          TextSpan(
                            text:
                                "Sudah punya akun? ",
                            style: TextStyle(
                              color:
                                  Colors.black54,
                              fontSize: 16,
                            ),
                          ),

                          TextSpan(
                            text: "Sign In",

                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}