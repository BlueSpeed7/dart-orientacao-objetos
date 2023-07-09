void main() {
  Fruta fruta01 = Fruta('laranja', 'amarela', 'amarga', 20, 30, 56.4);
  Fruta fruta02 = Fruta.nomeados(
      nome: 'uva',
      cor: 'roxa',
      sabor: 'doce',
      diasDesdeColheita: 30,
      diasParaMadura: 20,
      peso: 40.7,
      isMadura: true);
  print(fruta01.frase());
  print(fruta02.frase());
}

class Fruta {
  String nome, cor, sabor;
  int diasDesdeColheita, diasParaMadura;
  double peso;
  bool? isMadura;

  Fruta(
    this.nome,
    this.cor,
    this.sabor,
    this.diasDesdeColheita,
    this.diasParaMadura,
    this.peso,
  );

  Fruta.nomeados(
      {required this.nome,
      required this.cor,
      required this.sabor,
      required this.diasDesdeColheita,
      required this.diasParaMadura,
      required this.peso,
      required this.isMadura});

  bool? estaMadura() {
    isMadura ??= diasDesdeColheita >= diasParaMadura;
    return isMadura;
  }

  int funcQuantosDiasMadura(int dias) {
    int quantosDiasFaltam = diasParaMadura - dias;
    return quantosDiasFaltam;
  }

  String frase() {
    String result = '';
    isMadura = estaMadura();
    int quantosDiasFaltam = funcQuantosDiasMadura(diasDesdeColheita);
    if (isMadura == false) {
      result = 'A $nome de cor $cor com sabor $sabor pesa $peso gramas.\n'
          'Ela foi colhida há $diasDesdeColheita dias '
          'e precisa de $diasParaMadura dias para amadurecer, '
          'logo, ela não está madura.\n'
          'Faltam $quantosDiasFaltam dias para a $nome ficar madura.';
    } else {
      result = 'A $nome de cor $cor com sabor $sabor pesa $peso gramas.\n'
          'Ela foi colhida há $diasDesdeColheita dias '
          'e precisa de $diasParaMadura dias para amadurecer, '
          'logo, ela está madura.';
    }

    return result;
  }
}
