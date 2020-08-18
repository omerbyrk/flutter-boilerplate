/// All the application level failure
/// [Failure] is used if Datasources throw an error then Repositor convert it into failure to show on screen!
/// Example Flow :::: [DataSource]:Error -> [Repository]:Failure -> [UseCase]:Failure -> [Bloc]:OnMessageState -> [blocMessageBuilder]
class Failure {
  final String message;
  Failure({this.message});
}
