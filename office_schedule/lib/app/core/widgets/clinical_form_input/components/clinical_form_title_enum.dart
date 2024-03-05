import 'package:office_schedule/app/core/icons/clinical_icons.dart';

enum ClinicalFormTitleEnum {
  clock,
  company,
  fullName,
  createdBy,
  modifiedBy,
  email,
  password,
  passwordConfirm,
  notes,
  description,
  address,
  paymentType,
  paymentStatus,
  pacient,
  phone,
  specialty,
  statusSchedule
}

extension ClinicalFormTitleExtension on ClinicalFormTitleEnum {
  String get title {
    switch (this) {
      case ClinicalFormTitleEnum.clock:
        return 'Data e hora';
      case ClinicalFormTitleEnum.company:
        return 'Empresa';
      case ClinicalFormTitleEnum.fullName:
        return 'Nome completo';
      case ClinicalFormTitleEnum.createdBy:
        return 'Criado por';
      case ClinicalFormTitleEnum.modifiedBy:
        return 'Modificado por';
      case ClinicalFormTitleEnum.email:
        return 'E-mail';
      case ClinicalFormTitleEnum.password:
        return 'Senha';
      case ClinicalFormTitleEnum.passwordConfirm:
        return 'Confirmar Senha';
      case ClinicalFormTitleEnum.notes:
        return 'Observações';
      case ClinicalFormTitleEnum.description:
        return 'Descrição';
      case ClinicalFormTitleEnum.address:
        return 'Endereço';
      case ClinicalFormTitleEnum.paymentType:
        return 'Tipo de pagamento';
      case ClinicalFormTitleEnum.paymentStatus:
        return 'Status do pagamento';
      case ClinicalFormTitleEnum.pacient:
        return 'Paciente';
      case ClinicalFormTitleEnum.phone:
        return 'Telefone';
      case ClinicalFormTitleEnum.specialty:
        return 'Especialidade';
      case ClinicalFormTitleEnum.statusSchedule:
        return 'Consulta realizada?';
      default:
        return '';
    }
  }

  String get icon {
    switch (this) {
      case ClinicalFormTitleEnum.clock:
        return ClinicalIcons.formClockGray;
      case ClinicalFormTitleEnum.company:
        return ClinicalIcons.formCompanyGray;
      case ClinicalFormTitleEnum.fullName:
        return ClinicalIcons.formPersonGray;
      case ClinicalFormTitleEnum.email:
        return ClinicalIcons.formEmailGray;
      case ClinicalFormTitleEnum.password:
      case ClinicalFormTitleEnum.passwordConfirm:
        return ClinicalIcons.formLockGray;
      case ClinicalFormTitleEnum.notes:
        return ClinicalIcons.formNotesGray;
      case ClinicalFormTitleEnum.paymentStatus:
        return ClinicalIcons.formPaymentGray;
      case ClinicalFormTitleEnum.phone:
        return ClinicalIcons.formPhoneGray;
      case ClinicalFormTitleEnum.specialty:
        return ClinicalIcons.formSpecialtyGray;
      case ClinicalFormTitleEnum.statusSchedule:
        return ClinicalIcons.formStatusScheduleGray;
      default:
        return '';
    }
  }
}
