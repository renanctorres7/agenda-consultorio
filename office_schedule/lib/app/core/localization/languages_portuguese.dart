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
  String get signUpButton => 'confirmar';

  @override
  String get signUpError => 'erro ao cadastrar usuário!';

  @override
  String get signUpSuccess =>
      'Cadastro feito com sucesso! Enviamos um e-mail de confirmação para você!';

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
  String get fullName => 'Nome completo';

  @override
  String get fullNameHint => 'Digite seu nome completo';

  @override
  String get phone => 'Telefone';

  @override
  String get phoneHint => 'Digite seu telefone, ex: (99) 99999-9999';

  @override
  String get specialty => 'Especialidade';

  @override
  String get specialtyHint => 'Digite sua especialidade';

  @override
  String get company => 'Empresa';

  @override
  String get companyHint => 'Digite o nome da sua empresa';

  @override
  String get loginError => 'usuário ou senha inválidos!';

  @override
  String get loginSuccess => 'Login feito com sucesso';

  @override
  String get emailError => 'E-mail inválido';

  @override
  String get emailEmptyError => 'Insira seu e-mail';

  @override
  String get passwordError => 'Senha inválida';

  @override
  String get passwordEmptyError => 'Insira sua senha';

  @override
  String get passwordErrorLength => 'Sua senha deve ter no mínimo 6 caracteres';

  @override
  String get passwordConfirmError => 'Senhas não conferem';

  @override
  String get fullNameError => 'Nome inválido';

  @override
  String get phoneError => 'Telefone inválido';

  @override
  String get validationEmptyError => 'Campo obrigatório';

  /// CLINICAL FORM
  @override
  String get createdBy => 'Criado por';

  @override
  String get modifiedBy => 'Modificado por';

  @override
  String get notes => 'Observações';

  @override
  String get description => 'Descrição';

  @override
  String get address => 'Endereço';

  @override
  String get paymentType => 'Tipo de pagamento';

  @override
  String get paymentStatus => 'Status do pagamento';

  @override
  String get pacient => 'Paciente';

  @override
  String get statusSchedule => 'Consulta realizada?';

  @override
  String get clock => 'Data e hora';

  @override
  String get status => 'Status';

  /// DIALOG ERROR
  @override
  String get dialogErrorTitle => 'Erro!';

  @override
  String get dialogErrorButton => 'fechar';

  @override
  String get dialogErrorInitialMessage => 'Ocorreu um erro inesperado: ';

  /// DIALOG SUCCESS
  @override
  String get dialogSuccessTitle => 'Sucesso!';

  /// API ERROR
  @override
  String get validationFailed => 'Erro de validação no servidor';

  @override
  String get usernameAlreadyExists => 'usuário já cadastrado!';

  /// CALENDAR
  @override
  String get month => 'Mês';

  @override
  String get week => 'Semana';

  @override
  String get day => 'Dia';

  @override
  String get today => 'Hoje';

  /// WELCOME
  @override
  String get hello => 'Olá!';
}
