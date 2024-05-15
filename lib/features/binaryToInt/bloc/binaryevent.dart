abstract class BinaryEvent {
  BinaryEvent();
}

class BinaryToInt extends BinaryEvent {
  final String binaryinput;
  BinaryToInt(this.binaryinput);
}
