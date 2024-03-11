import 'package:office_schedule/app/core/localization/languages.dart';

class LanguagesPortugues extends Languages {
  /// LOGIN
  @override
  String get appName => 'Agenda Clínica';

  @override
  String get login => 'Entrar';

  @override
  String get signUp => 'Cadastrar';

  @override
  String get email => 'E-mail';

  @override
  String get emailHint => 'Digite seu e-mail';

  @override
  String get password => 'Senha';

  @override
  String get passwordHint => 'Digite sua senha';

  @override
  String get passwordConfirm => 'Confirmar senha';

  @override
  String get passwordConfirmHint => 'Digite sua senha novamente';

  @override
  String get forgotPassword => 'Esqueceu a senha?';

  @override
  String get loginButton => 'Entrar';

  @override
  String get signUpButton => 'Cadastrar';

  @override
  String get fullName => 'Nome completo';

  @override
  String get fullNameHint => 'Digite seu nome completo';

  @override
  String get phone => 'Telefone';

  @override
  String get phoneHint => 'Digite seu telefone';

  @override
  String get specialty => 'Especialidade';

  @override
  String get specialtyHint => 'Digite sua especialidade';

  @override
  String get company => 'Empresa';

  @override
  String get companyHint => 'Digite o nome da sua empresa';

  @override
  String get loginError => 'Erro ao fazer login';

  @override
  String get loginSuccess => 'Login feito com sucesso';

  @override
  String get emailError => 'E-mail inválido';

  @override
  String get passwordError => 'Senha inválida';

  @override
  String get passwordConfirmError => 'Senhas não conferem';

  @override
  String get fullNameError => 'Nome inválido';

  @override
  String get phoneError => 'Telefone inválido';
}
