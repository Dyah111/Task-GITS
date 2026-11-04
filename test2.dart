import "dart:io";

List<int> soal2(List<int> papanSkor, List<int> skorGITS) {
  //mencari skor unik
    List<int> unikSkor = [];
    for (int skors in papanSkor) {
        if (unikSkor.isEmpty || unikSkor.last != skors) {
            unikSkor.add(skors);
        }
    }

  //mencari peringkat GITS
    List<int> peringkat = [];
    for (int skor in skorGITS) {
        int rank = 1;
        for (int skors in unikSkor) {
            if (skors > skor) {
                rank++;
            } else if (skor == skor) {
                break;
            }
        }
        peringkat.add(rank);
    }
    return peringkat;
}

void main() {
    stdout.write("Masukkan jumlah pemain: ");
    int n = int.parse(stdin.readLineSync()!);
    stdout.write("Masukkan skor pemain: ");
    List<int> papanSkor = stdin
      .readLineSync()!
      .split(" ")
      .map(int.parse)
      .toList();

    stdout.write("Masukkan jumlah permainan GITS: ");
    int m = int.parse(stdin.readLineSync()!);
    stdout.write("Masukkan skor GITS: ");
    List<int> skorGITS = stdin
      .readLineSync()!
      .split(" ")
      .map(int.parse)
      .toList();
      
    List<int> hasilPeringkat = soal2(papanSkor, skorGITS);
    print("Peringkat GITS= $hasilPeringkat");
}