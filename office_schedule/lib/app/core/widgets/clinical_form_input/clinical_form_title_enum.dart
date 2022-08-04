enum ClinicalFormTitleEnum {
  clock('Data e hora'),
  company('Empresa'),
  fullName('Nome completo'),
  createdBy('Criado por'),
  modifiedBy('Modificado por'),

  email('E-mail'),
  password('Senha'),
  passwordConfirm('Confirmar Senha'),

  notes('Observações'),
  description('Descrição'),
  address('Endereço'),

  pacient('Paciente'),
  phone('Telefone'),
  specialty('Especialidade'),
  statusSchedule('Consulta realizada?');

  final String title;
  const ClinicalFormTitleEnum(this.title);
}
