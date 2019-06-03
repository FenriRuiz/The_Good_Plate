import 'package:the_good_plate/modelos/modelo_pedidos.dart';

class Metodos extends ModeloPedido {
  double total = 0;
  double subtotal = 0;
  double envio = 1.0;

  double precioSubtotal() {
    for (int i = 0; i < pedidos.length; i++) {
      subtotal += (pedidos[i].cantidad * pedidos[i].precio);
    }
    return subtotal;
  }

  String precioTotal() {
    total = precioSubtotal() + envio;
    return total.toStringAsFixed(2).toString();
  }
}
