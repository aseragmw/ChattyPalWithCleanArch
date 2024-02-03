import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:ChattyPal/features/auth/data/datasources/remote_data_source/auth_remote_datasource.dart';
import 'package:ChattyPal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ChattyPal/features/auth/domian/usecases/login_usecase.dart';
import 'package:ChattyPal/features/auth/domian/usecases/register_usecase.dart';
import 'package:ChattyPal/features/auth/domian/usecases/update_user_display_name_usecase.dart';
import 'package:ChattyPal/features/auth/domian/usecases/update_user_email_usecase.dart';
import 'package:ChattyPal/features/auth/domian/usecases/update_user_password_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:meta/meta.dart';
part 'basic_auth_provider_event.dart';

part 'basic_auth_provider_state.dart';

class BasicAuthProviderBloc extends Bloc<BasicAuthProviderEvent, BasicAuthProviderState> {
  BasicAuthProviderBloc() : super(BasicAuthProviderInitial()) {
    on<BasicAuthProviderEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());

      LoginUsecase loginUsecase =
          LoginUsecase(authRepository: AuthRepositoryImpl(remoteDataSource: AuthRemoteDataSourceImplWithFirebase()));
      final either = await loginUsecase.call(event.email, event.password);
      either.fold((l) => emit(LoginErrorState(l.message)), (r) => emit(LoginSuccessState()));
    });

    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoadingState());
      log('5555555555555555666666666666655');

      RegisterUsecase registerUsecase =
          RegisterUsecase(authRepository: AuthRepositoryImpl(remoteDataSource: AuthRemoteDataSourceImplWithFirebase()));
      log('55555555555555');

      final either = await registerUsecase.call(event.name, event.email, event.password);
      log('5555');
      either.fold((l) {
        log('hereee1');
        emit(RegisterErrorState(l.message));
      }, (r) {
        log('hereee2');
        emit(RegisterSuccessState());
      });
    });

    on<ChangeUserDisplayNameEvent>((event, emit) async {
      emit(ChangeUserDisplayNameLodaingState());
      UpdateDisplayNameUsecase updateDisplayNameUsecase =
          UpdateDisplayNameUsecase(authRepository: AuthRepositoryImpl(remoteDataSource: AuthRemoteDataSourceImplWithFirebase()));
      final either = await updateDisplayNameUsecase.call(event.name);
      either.fold((l) => emit(ChangeUserDisplayNameErrorState(l.message)), (r) => emit(ChangeUserDisplayNameSuccessState()));
    });

    on<ChangeUserEmailEvent>((event, emit) async {
      emit(ChangeUserEmailLodaingState());
      UpdateUserEmailUsecase updateUserEmailUsecase =
          UpdateUserEmailUsecase(authRepository: AuthRepositoryImpl(remoteDataSource: AuthRemoteDataSourceImplWithFirebase()));
      final either = await updateUserEmailUsecase.call(event.email);
      either.fold((l) => emit(ChangeUserEmailErrorState(l.message)), (r) => emit(ChangeUserEmailSuccessState()));
    });

    on<ChangeUserPasswordEvent>((event, emit) async {
      emit(ChangeUserPasswordLodaingState());
      UpdateUserPasswordUsecase updateUserPasswordUsecase =
          UpdateUserPasswordUsecase(authRepository: AuthRepositoryImpl(remoteDataSource: AuthRemoteDataSourceImplWithFirebase()));
      final either = await updateUserPasswordUsecase.call(event.password);
      either.fold((l) => emit(ChangeUserPasswordErrorState(l.message)), (r) => emit(ChangeUserPasswordSuccessState()));
    });

    on<ChangeUserBioEvent>((event, emit) async {
      //TODO
      // emit(ChangeUserBioLodaingState());
      // try {
      //   await FirestoreDatabase.updateUser(AppConstants.userId!, {'bio': event.bio});
      //   emit(ChangeUserBioSuccessState());
      // } on BasicAuthException catch (e) {
      //   log('Something went wrong');
      //   emit(ChangeUserBioErrorState('Something went wrong'));
      // } catch (e) {
      //   log(e.toString());
      //   emit(ChangeUserPasswordErrorState('Something went wrong'));
      // }
    });

    on<SaveUserExtraDataEvent>((event, emit) async {
      emit(SaveUserExtraDataLodaingState());
//TODO
      // try {
      //   if (event.photo != null) {
      //     final fileName = basename(event.photo!.path);
      //     final destination = 'files/$fileName';

      //     try {
      //       final ref = FirebaseStorage.instance.ref(destination).child('file/');
      //       final uploadTask = await ref.putFile(event.photo!);
      //       final url = await uploadTask.ref.getDownloadURL();
      //       log('hereeeeeeeeeeeeeeeeeee');
      //       await FirestoreDatabase.updateUser(AppConstants.userId!, {'imgUrl': url});
      //       await FirebaseAuth.instance.currentUser!.updatePhotoURL(url);

      //       event.photoPath = url;
      //     } catch (e) {
      //       log('error occured');
      //     }
      //     AppConstants.userProfileImgUrl = event.photoPath;
      //     CacheManager.setValue(userProfileImgUrlCacheKey, event.photoPath);
      //   }
      //   await FirestoreDatabase.updateUser(AppConstants.userId!, {'bio': event.bioText});
      //   if (event.bioText.isEmpty) {
      //     AppConstants.userBio = '';
      //     CacheManager.setValue(userBioCacheKey, '');
      //   } else {
      //     AppConstants.userBio = event.bioText;
      //     CacheManager.setValue(userBioCacheKey, event.bioText);
      //   }
      //   emit(SaveUserExtraDataSuccessState());
      // } catch (e) {
      //   emit(SaveUserExtraDataErrorState('Something went wrong'));
      // }
    });
  }
}
