abstract class BinaryEvent {
  BinaryEvent();
}

class IntToBinary extends BinaryEvent {
  final String binaryinput;
  IntToBinary(this.binaryinput);
}
