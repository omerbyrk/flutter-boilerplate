import '../../data/models/user_model.dart';

// API den gelen modelleri entityden ayırdık çünkü, Entitynin içine ui yada bloc ile ilgili extra tanımalamalar yapılabilir.
// Mesela bir for döngüsü kurulacaktır, for döngüsünün statesini UserEntity için tanımlayacak properyler konulabilir.
// Bir model bir çok Entitynin üst sınıfı.
// Repositoryler Entity ile çalışır.
class UserEntity extends UserModel {
  UserEntity();
  // Eğer bunu her entity için yapmak sana zor geliyorsa ve gerek duymuyorsan, Entityleri silip yerine Modelleri kullanabilirsin.
  factory UserEntity.fromModel(UserModel model) => UserEntity()
    ..id = model.id
    ..username = model.username
    ..password = model.password
    ..fullname = model.fullname
    ..country = model.country
    ..twitterAccount = model.twitterAccount
    ..age = model.age;
}
