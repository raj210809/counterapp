abstract class BinaryEvent {}

class IntToBinary extends BinaryEvent {
  final String integer; 

  IntToBinary(this.integer)
}
