void main() {
  // var resultGen = callGen(2000);
  // print(resultGen);
  // var count = callColor();
  // print(count);
  callWeb("Google", port: "443", protocal: "https");
}
//Generetion
String callGen(int year){
  print(year);

  // if (year >= 1996){
  //   print("Gen Z");
  // }else {
  //   print("Gen Y or Upper");
  // }
  
  //        เช็คเงื่อนไข         จริง           เท็จ
  var gen = (year >= 1996) ? "Gen Z" : "Gen Y or Upper";
  return gen;
}
//for in & return
int callColor([String newColor = "black"]){
  List<dynamic> colors = ["red", "blue", "green"];
  colors.add(newColor);
  for (var item in colors){
    print(item);
  }
  return colors.length;
}
// Arrow Funtion
void callWeb(String web, {String protocal = "https", String port = "80"}) => print("$protocal $web $port");