import 'dart:io';

// cek semua karakter sebagai angka
bool cek(String s, int i) {
  if (i == s.length) {
        return true;
    }
    if (s[i].compareTo('0') < 0 || s[i].compareTo('9') > 0) {
        return false;
    }
    return cek(s, i + 1);
}

// menyamakan kanan kiri inputan angka
int samakan(List<int> hasil, int kiri, int kanan) {
  if (kiri >= kanan) {
    return 0;
  }

  int k = 0;

  if (hasil[kiri] != hasil[kanan]) {
    if (hasil[kiri] > hasil[kanan]) {
      hasil[kanan] = hasil[kiri];
    } else {
      hasil[kiri] = hasil[kanan];
    }
    k = 1;
  }
  return k + samakan(hasil, kiri + 1, kanan - 1);
}

// ubah jadi sembilan
void ubahSembilan(List<int> hasil, int kiri, int kanan, int sisa, List<int> asli) {
  if (kiri > kanan) {
    return;
  }

  if (kiri == kanan) {
    if (sisa >= 1) {
      hasil[kiri] = 9;
    }
    return;
  }

  if (hasil[kiri] < 9) {
    if (hasil[kiri] != 9) {
      bool selesai = asli[kiri] != asli[kanan];
      int koin = 2;
      if (selesai) {
        koin = 1;
      }

      if (sisa >= koin) {
        hasil[kiri] = 9;
        hasil[kanan] = 9;
        sisa -= koin;
      }
    }
  }
  ubahSembilan(hasil, kiri + 1, kanan - 1, sisa, asli);
}

// ubah menjadi angka paling tinggi
String palindrome(String s, int k) {
  if (!cek(s, 0) || s.isEmpty || k < 0) {
    return "-1";
  }

  List<int> hasil = s.split('').map(int.parse).toList();
  List<int> asli = List.from(hasil);

  int sisa = k - samakan(hasil, 0, hasil.length - 1);

  if (sisa < 0) {
    return "-1";
  }

  ubahSembilan(hasil, 0, hasil.length - 1, sisa, asli);

  return hasil.join('');
}

void main() {
  stdout.write("Masukkan angka: ");
  String s = stdin.readLineSync()!;
  stdout.write("Masukkan jumlah perubahan: ");
  int k = int.parse(stdin.readLineSync()!);

  String hasil = palindrome(s, k);
  print("Hasil= $hasil");
}