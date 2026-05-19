class Mahasiswa {
  int? id;
  String nama;
  String ttl;
  String jenisKelamin;
  String alamat;
  String agama;
  String pendidikan;
  String noHp;
  String email;

  Mahasiswa({
    this.id,
    required this.nama,
    required this.ttl,
    required this.jenisKelamin,
    required this.alamat,
    required this.agama,
    required this.pendidikan,
    required this.noHp,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'ttl': ttl,
      'jenisKelamin': jenisKelamin,
      'alamat': alamat,
      'agama': agama,
      'pendidikan': pendidikan,
      'noHp': noHp,
      'email': email,
    };
  }

  factory Mahasiswa.fromMap(Map<String, dynamic> map) {
    return Mahasiswa(
      id: map['id'],
      nama: map['nama'],
      ttl: map['ttl'],
      jenisKelamin: map['jenisKelamin'],
      alamat: map['alamat'],
      agama: map['agama'],
      pendidikan: map['pendidikan'],
      noHp: map['noHp'],
      email: map['email'],
    );
  }
}