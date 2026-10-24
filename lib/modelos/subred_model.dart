class SubredModelo {
  final String ipIngresada;
  final int prefijo;
  final String mascara;
  final String direccionRed;
  final String broadcast;
  final String primeraIpUtilizable;
  final String ultimaIpUtilizable;
  final int bitsHost;
  final int totalDirecciones;
  final int hostsUtilizables;
  final int salto;

  const SubredModelo({
    required this.ipIngresada,
    required this.prefijo,
    required this.mascara,
    required this.direccionRed,
    required this.broadcast,
    required this.primeraIpUtilizable,
    required this.ultimaIpUtilizable,
    required this.bitsHost,
    required this.totalDirecciones,
    required this.hostsUtilizables,
    required this.salto,
  });

  String get rangoHosts => '$primeraIpUtilizable - $ultimaIpUtilizable';

  factory SubredModelo.calcular({required String ip, required int prefijo}) {
    final octetos = _convertirIpAOctetos(ip);
    final ipNumero = _convertirOctetosANumero(octetos);
    final mascaraNumero = prefijo == 0
        ? 0
        : (0xFFFFFFFF << (32 - prefijo)) & 0xFFFFFFFF;
    final redNumero = ipNumero & mascaraNumero;
    final bitsHost = 32 - prefijo;
    final totalDirecciones = 1 << bitsHost;
    final broadcastNumero = redNumero + totalDirecciones - 1;
    final hostsUtilizables = totalDirecciones > 2 ? totalDirecciones - 2 : 0;
    final primeraNumero = totalDirecciones > 1 ? redNumero + 1 : redNumero;
    final ultimaNumero = totalDirecciones > 1
        ? broadcastNumero - 1
        : broadcastNumero;
    final mascaraOctetos = _convertirNumeroAOctetos(mascaraNumero);

    return SubredModelo(
      ipIngresada: octetos.join('.'),
      prefijo: prefijo,
      mascara: mascaraOctetos.join('.'),
      direccionRed: _convertirNumeroAIp(redNumero),
      broadcast: _convertirNumeroAIp(broadcastNumero),
      primeraIpUtilizable: _convertirNumeroAIp(primeraNumero),
      ultimaIpUtilizable: _convertirNumeroAIp(ultimaNumero),
      bitsHost: bitsHost,
      totalDirecciones: totalDirecciones,
      hostsUtilizables: hostsUtilizables,
      salto: 256 - mascaraOctetos.last,
    );
  }

  static List<int> _convertirIpAOctetos(String ip) {
    final octetos = ip.trim().split('.');
    if (octetos.length != 4) {
      throw const FormatException('La dirección debe tener cuatro octetos');
    }

    final valores = octetos.map(int.parse).toList();
    if (valores.any((octeto) => octeto < 0 || octeto > 255)) {
      throw const FormatException('Cada octeto debe estar entre 0 y 255');
    }
    return valores;
  }

  static int _convertirOctetosANumero(List<int> octetos) {
    return (octetos[0] << 24) |
        (octetos[1] << 16) |
        (octetos[2] << 8) |
        octetos[3];
  }

  static List<int> _convertirNumeroAOctetos(int numero) {
    return [
      (numero >> 24) & 255,
      (numero >> 16) & 255,
      (numero >> 8) & 255,
      numero & 255,
    ];
  }

  static String _convertirNumeroAIp(int numero) {
    return _convertirNumeroAOctetos(numero).join('.');
  }
}
