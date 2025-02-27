import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/network/failure.dart';
import '../models/user_model.dart';

abstract class LoginDatasource {
  Future<Either<Failure, void>> login(UserModel user);

  Future<void> saveUser(UserModel userModel);

  UserModel? getUser();
}
class LoginDatasourceImpl extends LoginDatasource {
  @override
  Future<Either<Failure, void>> login(UserModel userModel) async {
    try {
      /*// محاولة تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      // تسجيل الدخول ناجح
      User? user = userCredential.user;

      if (user != null) {
        // الحصول على الاسم والـ UID من كائن User
        String? name = user.displayName;
        String uid = user.uid;

        // طباعة البيانات للحصول على التحقق
        print('User logged in: ${user.email}');
        print('User UID: $uid');
        print('User Name: $name');

        // تحديث كائن UserModel بالـ UID والاسم من Firebase
        UserModel updatedUserModel = userModel.copyWith(uid: uid, name: name ?? '');

        // حفظ المستخدم في Hive
        await saveUser(updatedUserModel);

        // طباعة المستخدم المحفوظ للتحقق
        print('++++++++++++++++++++++++++++++++++');
        UserModel? savedUser = getIt<LoginDatasource>().getUser();
        if (savedUser != null) {
          print('Saved user UID: ${savedUser.uid}');
          print('Saved user name: ${savedUser.name}');
        }
        print('000000000000000');
        return right(null); // تسجيل الدخول ناجح
      }*/
    } catch (e) {
      print('Login failed: $e');
      return left(FailureError(error: e.toString())); // تسجيل الدخول فشل
    }
    return left(const FailureError(error: 'Unknown error occurred'));
  }

  @override
  Future<void> saveUser(UserModel user) async {
    var box = Hive.box<UserModel>('userBox');
    await box.put('user', user);
    print('User saved: ${user.uid}');
  }

  @override
  UserModel? getUser() {
    var box = Hive.box<UserModel>('userBox');
    return box.get('user');
  }
}
