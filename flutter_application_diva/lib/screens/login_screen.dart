import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoading = false;

  Future<void> login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email dan password harus diisi"),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      QuerySnapshot user = await FirebaseFirestore.instance
          .collection('users')
          .where(
            'email',
            isEqualTo: emailController.text.trim(),
          )
          .where(
            'password',
            isEqualTo: passwordController.text,
          )
          .get();

      if (user.docs.isNotEmpty) {
        String nama = user.docs.first['namaLengkap'];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(
              nama: nama,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Email atau password salah",
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
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

                const SizedBox(height: 10),

                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Selamat Datang!",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Silahkan login untuk\nmelanjutkan",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 35),

                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    hintText: "Email/No. Hp",

                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),

                      borderSide:
                          const BorderSide(
                        color: Colors.grey,
                      ),
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),

                      borderSide:
                          const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  controller:
                      passwordController,

                  obscureText:
                      !isPasswordVisible,

                  decoration: InputDecoration(
                    hintText: "Password",

                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),

                    suffixIcon: IconButton(
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

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),

                      borderSide:
                          const BorderSide(
                        color: Colors.grey,
                      ),
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),

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
                            : login,

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
                            "Sign In",
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
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              const RegisterScreen(),
                        ),
                      );
                    },

                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Belum punya akun? ",
                            style: TextStyle(
                              color:
                                  Colors.black54,
                              fontSize: 16,
                            ),
                          ),

                          TextSpan(
                            text: "Sign Up",
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