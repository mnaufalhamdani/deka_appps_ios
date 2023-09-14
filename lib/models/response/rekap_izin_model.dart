
import '../entities/rekap_izin/rekap_izin.dart';

class RekapIzinModel extends RekapIzinEntity {
  RekapIzinModel({
      String ? code,
      String ? jpayrollId,
      String ? name,
      String ? nik,
      String ? costCenterCode,
      String ? reasonType,
      String ? reasonId,
      String ? potongCuti,
      String ? startDate,
      String ? startTime,
      String ? endDate,
      String ? endTime,
      String ? lamaCuti,
      String ? tglBatal,
      String ? latitude,
      String ? longitude,
      String ? jamKembali,
      String ? photo1,
      String ? photo2,
      String ? photo3,
      String ? keterangan,
      String ? status,
      String ? statusApproval,
      String ? statusKembali,
      String ? statusBatal,
      String ? createdAt,
      String ? updatedAt,
      String ? createdBy,
      String ? updatedBy,
      String ? reasonName,
      String ? reasonTypeName,
      String ? userApproval,
      String ? descApproval,
  }): super(
      code : code,
      jpayrollId : jpayrollId,
      name : name,
      nik : nik,
      costCenterCode : costCenterCode,
      reasonType : reasonType,
      reasonId : reasonId,
      potongCuti : potongCuti,
      startDate : startDate,
      startTime : startTime,
      endDate : endDate,
      endTime : endTime,
      lamaCuti : lamaCuti,
      tglBatal : tglBatal,
      latitude : latitude,
      longitude : longitude,
      jamKembali : jamKembali,
      photo1 : photo1,
      photo2 : photo2,
      photo3 : photo3,
      keterangan : keterangan,
      status : status,
      statusApproval : statusApproval,
      statusKembali : statusKembali,
      statusBatal : statusBatal,
      createdAt : createdAt,
      updatedAt : updatedAt,
      createdBy : createdBy,
      updatedBy : updatedBy,
      reasonName : reasonName,
      reasonTypeName : reasonTypeName,
      userApproval : userApproval,
      descApproval : descApproval,
  );

  factory RekapIzinModel.fromJson(Map<String, dynamic> json) {
    return RekapIzinModel(
      code: json['code'],
      jpayrollId: json['jpayroll_id'],
      name: json['name'],
      nik: json['nik'],
      costCenterCode: json['cost_center_code'],
      reasonType: json['reason_type'],
      reasonId: json['reason_id'],
      potongCuti: json['potong_cuti'],
      startDate: json['start_date'],
      startTime: json['start_time'],
      endDate: json['end_date'],
      endTime: json['end_time'],
      lamaCuti: json['lama_cuti'],
      tglBatal: json['tgl_batal'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      jamKembali: json['jam_kembali'],
      photo1: json['photo_1'],
      photo2: json['photo_2'],
      photo3: json['photo_3'],
      keterangan: json['keterangan'],
      status: json['status'],
      statusApproval: json['status_approval'],
      statusKembali: json['status_kembali'],
      statusBatal: json['status_batal'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      reasonName: json['reason_name'],
      reasonTypeName: json['reason_type_name'],
      userApproval: json['user_approval'],
      descApproval: json['desc_approval'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['code'] = code;
  //   map['jpayroll_id'] = jpayrollId;
  //   map['name'] = name;
  //   map['nik'] = nik;
  //   map['cost_center_code'] = costCenterCode;
  //   map['reason_type'] = reasonType;
  //   map['reason_id'] = reasonId;
  //   map['potong_cuti'] = potongCuti;
  //   map['start_date'] = startDate;
  //   map['start_time'] = startTime;
  //   map['end_date'] = endDate;
  //   map['end_time'] = endTime;
  //   map['lama_cuti'] = lamaCuti;
  //   map['tgl_batal'] = tglBatal;
  //   map['latitude'] = latitude;
  //   map['longitude'] = longitude;
  //   map['jam_kembali'] = jamKembali;
  //   map['photo_1'] = photo1;
  //   map['photo_2'] = photo2;
  //   map['photo_3'] = photo3;
  //   map['keterangan'] = keterangan;
  //   map['status'] = status;
  //   map['status_approval'] = statusApproval;
  //   map['status_kembali'] = statusKembali;
  //   map['status_batal'] = statusBatal;
  //   map['created_at'] = createdAt;
  //   map['updated_at'] = updatedAt;
  //   map['created_by'] = createdBy;
  //   map['updated_by'] = updatedBy;
  //   map['reason_name'] = reasonName;
  //   map['reason_type_name'] = reasonTypeName;
  //   map['user_approval'] = userApproval;
  //   map['desc_approval'] = descApproval;
  //   return map;
  // }

}