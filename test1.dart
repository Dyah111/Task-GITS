import "dart:io";

int soal1(int n) {
    return n * (n + 1) ~/ 2 + 1;
}

void main() {
    stdout.write("Masukkan nilai n: ");
    int n = int.parse(stdin.readLineSync()!);
    String result = "";
    for (int i = 1; i <= n; i++) {
        result += "${soal1(i)}";
        if (i < n) result += "-";
    }
    print("Hasil= $result");
}