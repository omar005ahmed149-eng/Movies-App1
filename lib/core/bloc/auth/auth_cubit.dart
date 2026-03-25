import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/core/bloc/auth/auth_state.dart';
import 'package:movies/core/bloc/movies/movies_cubit.dart';
import 'package:movies/core/models/user_model.dart';
import 'package:movies/firebase/firebase_services.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._moviesCubit) : super(const AuthState());

  final MoviesCubit _moviesCubit;

  Future<void> bootstrapSession() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      emit(state.copyWith(status: AuthStatus.unauthenticated, clearUser: true));
      return;
    }

    final user = await FirebaseService.getUSerFromFIreStore(firebaseUser.uid);
    if (user == null) {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(status: AuthStatus.unauthenticated, clearUser: true));
      return;
    }

    _moviesCubit.setPoster(user.poster);
    await _moviesCubit.loadFromFirestore();
    emit(state.copyWith(status: AuthStatus.authenticated, user: user));
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final credential =
        await FirebaseService.login(email: email, password: password);
    final user =
        await FirebaseService.getUSerFromFIreStore(credential.user!.uid);
    if (user == null) {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(status: AuthStatus.unauthenticated, clearUser: true));
      return null;
    }
    _moviesCubit.setPoster(user.poster);
    await _moviesCubit.loadFromFirestore();
    emit(state.copyWith(status: AuthStatus.authenticated, user: user));
    return user;
  }

  Future<void> register(UserModel user, String password) async {
    final credential = await FirebaseService.register(
      email: user.email,
      password: password,
    );
    final userToSave = UserModel(
      id: credential.user!.uid,
      name: user.name,
      email: user.email,
      phoneNumber: user.phoneNumber,
      poster: user.poster,
    );
    await FirebaseService.addUserToFireStore(userToSave);
    await FirebaseAuth.instance.signOut();
    emit(state.copyWith(status: AuthStatus.unauthenticated, clearUser: true));
  }

  Future<void> logout() async {
    _moviesCubit.clearAll();
    await FirebaseAuth.instance.signOut();
    emit(state.copyWith(status: AuthStatus.unauthenticated, clearUser: true));
  }

  void updateCurrentUser(UserModel user) {
    emit(state.copyWith(status: AuthStatus.authenticated, user: user));
  }
}
