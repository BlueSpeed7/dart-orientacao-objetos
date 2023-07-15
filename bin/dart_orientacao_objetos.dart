void main() {
  Fruta fruta01 = Fruta('laranja', 'amarela', 30.5, 'amarga', 20);
  Citrica citrica01 = Citrica('limão', 'verde', 20.0, 'ácido', 15, 7.5);
  Legume legume01 = Legume('pimentão', 'vermelho', 42.3, 25, true);
  fruta01.estaMadura(30);
  citrica01.estaMadura(10);
  print(fruta01.toString());
  fruta01.fazerSuco();
  print(citrica01.toString());
  print(legume01.toString());
  legume01.cozinhar();
}

class Fruta extends Alimento {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, String cor, double peso, this.sabor, this.diasDesdeColheita)
      : super(nome, cor, peso);

  bool? estaMadura(int diasParaMadura) {
    isMadura ??= diasDesdeColheita >= diasParaMadura;
    return isMadura;
  }

  void fazerSuco() {
    print('Você fez um ótimo suco de $nome.');
  }

  @override
  String toString() {
    String result = '';
    if (isMadura == false) {
      result = 'O(a) $nome de cor $cor com sabor $sabor pesa $peso gramas.\n'
          'Ele(a) foi colhido(a) há $diasDesdeColheita dias e não está maduro(a).';
    } else {
      result = 'O(a) $nome de cor $cor com sabor $sabor pesa $peso gramas.\n'
          'Ele(a) foi colhido(a) há $diasDesdeColheita dias e está maduro(a).';
    }
    return result;
  }
}

class Alimento {
  String nome, cor;
  double peso;

  Alimento(this.nome, this.cor, this.peso);

  @override
  String toString() {
    return 'Este(a) $nome pesa $peso gramas e é $cor.';
  }
}

class Legume extends Alimento {
  int diasDesdeColheita;
  bool? isPrecisaCozinhar;

  Legume(String nome, String cor, double peso, this.diasDesdeColheita,
      this.isPrecisaCozinhar)
      : super(nome, cor, peso);

  void cozinhar() {
    if (isPrecisaCozinhar == true) {
      print('Pronto, o(a) $nome está cozinhando.');
      isPrecisaCozinhar = false;
    } else {
      print('Nem precisa cozinhar.');
    }
  }
}

class Citrica extends Fruta {
  double nivelAzedo;

  Citrica(String nome, String cor, double peso, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, cor, peso, sabor, diasDesdeColheita);
}

class Noz extends Fruta {
  double porcentagemOleoNatural;

  Noz(String nome, String cor, double peso, String sabor, int diasDesdeColheita,
      this.porcentagemOleoNatural)
      : super(nome, cor, peso, sabor, diasDesdeColheita);
}
