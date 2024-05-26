/*
PROXY
Proxy es un patrón de diseño estructural que te permite propo-
rcionar un sustituto o marcador de posición para otro objeto.
Un proxy controla el acceso al objeto original, permitiéndote
hacer algo antes o después de que la solicitud llegue al obje-
to original.

Patrones de diseño - Alexander Shvets


*/

void main() {
  Graphic graphic = ImageProxy();
  Graphic graphic2 = ImageProxy();

  // Probando la llamada al método display
  print(graphic.display());
  print(graphic.display());
  print(graphic2.display());
}

class Graphic {
  String display() {
    return "Graphic";
  }
}

class Image extends Graphic {
  @override
  String display() {
    return "Display image";
  }

  void load() {
    // Cargar la imagen (código de simulación)
    print("Loading image...");
  }
}

class ImageProxy extends Graphic {
  Image? _image;

  @override
  String display() {
    if (_image == null) {
      _image = Image();
      _image?.load();
    }
    return _image!.display();
  }
}
