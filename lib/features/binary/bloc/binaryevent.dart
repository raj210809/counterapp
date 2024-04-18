abstract class BinaryEvent {
  BinaryEvent();
}

class IntToBinary extends BinaryEvent {
  final String integer;

  IntToBinary(this.integer);
}
