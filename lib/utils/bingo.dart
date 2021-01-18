import 'dart:math';

class Bingo {
  List<int> fila1 = new List<int>();
  List<int> fila2 = new List<int>();
  List<int> fila3 = new List<int>();
  List<int> fila4 = new List<int>();
  List<int> fila5 = new List<int>();
  List<List<int>> carton = new List();

  List<int> _generarLinea(int x) {
    int a = x;
    List<int> fila = new List<int>();
    List<int> numerosAleatorios1 = new List<int>();
    for (int i = 0; i <= 14; i++) {
      numerosAleatorios1.add(a);
      a = (a + 1);
    }
    Random r = new Random();
    for (int i = numerosAleatorios1.length; i > 0; i--) {
      int posicion = r.nextInt(i);
      int tmp = numerosAleatorios1[i - 1];
      numerosAleatorios1[i - 1] = numerosAleatorios1[posicion];
      numerosAleatorios1[posicion] = tmp;
    }
    for (int i = 1; i <= 5; i++) {
      fila.add(numerosAleatorios1[i]);
    }
    return fila;
  }

  /// Genera el tablero 5x5 de numeros aleatorios
  List<List<int>> generarCarton() {
    print("   B  I  N  G  O");
    fila1 = _generarLinea(1);
    carton.add(fila1);
    fila2 = _generarLinea(16);
    carton.add(fila2);
    fila3 = _generarLinea(31);
    carton.add(fila3);
    fila4 = _generarLinea(46);
    carton.add(fila4);
    fila5 = _generarLinea(61);
    carton.add(fila5);

    return carton;
  }

  /// Genera las filas del tablero de los numeros del 1 al 75
  List<int> generarFila(int x) {
    List<int> fila = List();
    fila.add(x);
    fila.add(x + 15);
    fila.add(x + 30);
    fila.add(x + 45);
    fila.add(x + 60);
    return fila;
  }

  // List<List<bool>> generarControl() {
  //   List<List<bool>> control = List();
  //   control.add(_falseList());
  //   control.add(_falseList());
  //   control.add(_falseList());
  //   control.add(_falseList());
  //   control.add(_falseList());
  //   return control;
  // }

  // _falseList() {
  //   List<bool> list = List.filled(5, false);
  //   return list;
  // }

  int generarBalota(List<int> balotas) {
    Random r = Random();
    int bal;

    do {
      bal = r.nextInt(75);
    } while (balotas.contains(bal));

    return bal;
  }
}
