class Api{
  final String pre;
  final int sumpix;
  Api({
    required this.pre,
    required this.sumpix,
  });
  factory Api.fromJson(Map<String, dynamic> json){
    return Api(sumpix: json['sumpix'],pre: json['pre']);
  }
}