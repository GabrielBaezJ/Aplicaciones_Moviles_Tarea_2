class SubredModelo {
  // Datos de la subred
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

  // Constructor
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

  // Metodo calcular
  static SubredModelo calcular({required String ip, required int prefijo}) {
    // Conversión de la IP
    final octetos = _convertirIpAOctetos(ip);
    final ipNumero = _convertirOctetosANumero(octetos);

    // Calculo de la mascara
    final mascaraNumero = prefijo == 0
        ? 0
        : (0xFFFFFFFF << (32 - prefijo)) & 0xFFFFFFFF;

    // Calculo de la red
    final redNumero = ipNumero & mascaraNumero;
    final bitsHost = 32 - prefijo;
    final totalDirecciones = 1 << bitsHost;

    // Calculo de direcciones
    final broadcastNumero = redNumero + totalDirecciones - 1;
    final hostsUtilizables = totalDirecciones > 2 ? totalDirecciones - 2 : 0;
    final primeraNumero = totalDirecciones > 1 ? redNumero + 1 : redNumero;
    final ultimaNumero = totalDirecciones > 1
        ? broadcastNumero - 1
        : broadcastNumero;
    final mascaraOctetos = _convertirNumeroAOctetos(mascaraNumero);

    // Instanciacion del modelo
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
    // Separacion de octetos
    final octetos = ip.trim().split('.');
    if (octetos.length != 4) {
      throw const FormatException('La direccion debe tener cuatro octetos');
    }

    final valores = octetos.map(int.parse).toList();
    if (valores.any((octeto) => octeto < 0 || octeto > 255)) {
      throw const FormatException('Cada octeto debe estar entre 0 y 255');
    }
    return valores;
  }

  static int _convertirOctetosANumero(List<int> octetos) {
    // Conversion a numero
    return (octetos[0] << 24) |
        (octetos[1] << 16) |
        (octetos[2] << 8) |
        octetos[3];
  }

  static List<int> _convertirNumeroAOctetos(int numero) {
    // Conversion a octetos
    return [
      (numero >> 24) & 255,
      (numero >> 16) & 255,
      (numero >> 8) & 255,
      numero & 255,
    ];
  }

  static String _convertirNumeroAIp(int numero) {
    // Conversión a IP
    return _convertirNumeroAOctetos(numero).join('.');
  }
}
