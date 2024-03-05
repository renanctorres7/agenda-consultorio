enum ClinicalFormHintTextEnum {
  fullName('Digite seu nome completo'),

  email('Digite seu e-mail'),
  emailNew('Digite seu novo e-mail'),

  password('Digite sua senha'),
  passwordNew('Digite sua nova senha'),

  notes('Observações'),
  description('Descrição'),
  address('Endereço'),

  paymentType('Tipo de pagamento'),
  paymentStatus('Status do pagamento'),

  pacient('Paciente'),
  phone('Telefone'),
  specialty('Especialidade'),
  statusSchedule('Consulta realizada?');

  final String hintText;
  const ClinicalFormHintTextEnum(this.hintText);
}
