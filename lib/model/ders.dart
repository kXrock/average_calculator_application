class Ders{
 final String ad;
  final double harfdeger;
  final int kredideger;

  Ders({required this.ad,required this.harfdeger,required this.kredideger});
  @override
  String toString() {
    // TODO: implement toString
    return "ad:$ad not:$harfdeger kredi:$kredideger";
  }

  
}