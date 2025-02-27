import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/network/failure.dart';
import '../models/user_model.dart';

abstract class RegisterDatasource{
  Future<Either<Failure,void>> register(UserModel user);
  Future<void> saveUser(UserModel user);
  UserModel? getUser();
}
class RegisterDatasourceImpl extends RegisterDatasource {

  @override
  Future<Either<Failure, void>> register(UserModel user) async {

    try {
/*
      // إنشاء الحساب باستخدام البريد الإلكتروني وكلمة المرور
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // تحديث ملف المستخدم لتخزين اسم المستخدم
      await userCredential.user?.updateProfile(displayName: user.name);

      // إعادة تحميل معلومات المستخدم بعد التحديث
      await userCredential.user?.reload();
      User? updatedUser = FirebaseAuth.instance.currentUser;
      print('User registered: ${updatedUser?.email}, Username: ${updatedUser
          ?.displayName}   ${updatedUser?.uid}');
      if (updatedUser != null) {

        String uid= updatedUser.uid;

        user = user.copyWith(uid: uid);
        await saveUser(user);
        print('++++++++++++++++++++++++++++++++++');
        print(  getIt<RegisterDatasource>().getUser()   );
        return right(null);
      }



    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The account already exists for that email.');
        return left(
            const FailureError(error: 'The password provided is too weak.'));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return left(const FailureError(
            error: 'The account already exists for that email.'));

      }*/
    } catch (e) {
      print(e);
      return left(FailureError(error: e.toString()));
    }
    return left(const FailureError(error: 'Unknown error occurred'));
  }


// دالة لحفظ المستخدم في Hive
  Future<void> saveUser(UserModel user) async {
    var box = Hive.box<UserModel>('userBox');
    await box.put('user', user);
    print('User saved: ${user.uid}'); // تخزين الكائن في الـ Box
  }

// دالة لاسترجاع المستخدم من Hive
  UserModel? getUser() {
    var box = Hive.box<UserModel>('userBox');
    return box.get('user'); // استرجاع الكائن
  }
}