void main() {
  Fruta laranja1 = Fruta('laranja', 'amarela', 30.5, 'amarga', 20);
  Citrica limao1 = Citrica('limão', 'verde', 20.0, 'ácido', 15, 9.0);
  Legume pimentao1 = Legume('pimentão', 'vermelho', 47.0, 25, true);
  Noz noz1 = Noz('amendoim', 'marrom', 5.2, 'seco', 10, 70.0);
  laranja1.estaMadura(30);
  laranja1.printAlimento();
  laranja1.fazerSuco();
  limao1.estaMadura(10);
  limao1.printAlimento();
  limao1.existeRefri(true);
  pimentao1.printAlimento();
  pimentao1.cozinhar();
  noz1.estaMadura(20);
  noz1.printAlimento();
  noz1.separarIngredientes();
  noz1.fazerMassa();
  noz1.assar();
}

class Alimento {
  String nome, cor;
  double peso;

  Alimento(this.nome, this.cor, this.peso);

  void printAlimento() {
    print('Este(a) $nome pesa $peso gramas e é $cor.');
  }
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, String cor, double peso, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, cor, peso);

  bool? estaMadura(int diasParaMadura) {
    isMadura ??= diasDesdeColheita >= diasParaMadura;
    return isMadura;
  }

  void fazerSuco() {
    print('Você fez um ótimo suco de $nome.');
  }

  @override
  void printAlimento() {
    if (isMadura == false) {
      print('O(a) $nome de cor $cor com sabor $sabor pesa $peso gramas.\n'
          'Ele(a) foi colhido(a) há $diasDesdeColheita dias e não está maduro(a).');
    } else {
      print('O(a) $nome de cor $cor com sabor $sabor pesa $peso gramas.\n'
          'Ele(a) foi colhido(a) há $diasDesdeColheita dias e está maduro(a).');
    }
  }

  @override
  void separarIngredientes() {
    print('Separar o(a) $nome.');
  }

  @override
  void fazerMassa() {
    print('Misturar o(a) $nome com farinha, açúcar, ovos e fermento.');
  }

  @override
  void assar() {
    print('Colocar a massa no forno e esperar o bolo ficar pronto.');
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

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe refrigerante de $nome.');
    } else {
      print('Não existe refri de $nome.');
    }
  }

  @override
  void printAlimento() {
    print('O(a) $nome de cor $cor com sabor $sabor pesa $peso gramas\n'
        'e tem $nivelAzedo nível de azedo.');
  }
}

class Noz extends Fruta {
  double porcentagemOleoNatural;

  Noz(String nome, String cor, double peso, String sabor, int diasDesdeColheita,
      this.porcentagemOleoNatural)
      : super(nome, cor, peso, sabor, diasDesdeColheita);

  @override
  void printAlimento() {
    print('O(a) $nome de cor $cor com sabor $sabor pesa $peso gramas\n'
        'e tem $porcentagemOleoNatural% de óleo natural.');
  }

  @override
  void separarIngredientes() {
    super.separarIngredientes();
    print('Tirar a casca do(a) $nome.');
  }
}

abstract class Bolo {
  void separarIngredientes() {}

  void fazerMassa() {}

  void assar() {}
}
