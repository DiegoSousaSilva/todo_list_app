import 'package:todo_list_app/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_app/app/exceptions/auth_exception.dart';
import 'package:todo_list_app/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;
  String? infoMessage;

  LoginController({required UserService userService})
    : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      //notifyListeners();

      final _user = await _userService.login(email, password);

      if (_user != null) {
        success();
      } else {
        setError("Usuário ou senha inválidos!");
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      //notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      //notifyListeners();
      await _userService.forgotPassword(email);
      infoMessage = "Reset de senha enviado para o e-mail";
    } on AuthException catch (e) {
      setError(e.message);
    } catch (e) {
      setError('Erro ao resetar senha!');
    } finally {
      hideLoading();
      //notifyListeners();
    }
  }
}
