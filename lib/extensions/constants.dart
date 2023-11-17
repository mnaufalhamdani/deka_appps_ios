import 'package:deka_appps_ios/core/single_select/single_select_domain.dart';

const String BASE_URL = "https://appdk-trial.duakelinci.id:9393/api/webusagi/v2/hc/";
const int BASE_TIMEOUT = 60000 * 1;//1 MENIT
const String TYPE_APLIKASI = "hc";
const String NIK_EXAMPLE = '20101720';


const String varReset = "Reset Password";
const String varRegister = "Daftar User";
const String varDashboard = "Dashboard";
const String varRekapIzin = "Rekap Izin";
const String varGreeting = "Semoga Hari Anda Menyenangkan";
const String varGreetingLogin = "Silahkan login untuk melanjutkan";
const String varTotalAlpha = "Total Alpha";
const String varSisaCuti = "Sisa Cuti";
const String varTotalIzin = "Total Izin";
const String varIzinBelumDisetujui = "Izin Belum Disetujui";
const String varIzinDisetujui = "Izin Disetujui";
const String varIzinDitolak = "Izin Ditolak";
const String varUsername = "Username";
const String varPassword = "Password";

List<SingleSelectDomain> listLokasi = [
  SingleSelectDomain(codeOrId: "0", message: "Non Pati"),
  SingleSelectDomain(codeOrId: "1", message: "Pati"),
];

List<String> listTipeIzin = [
  "Full Day",
  "Half Day",
];

List<String> listKategoriIzin1 = [
  "Cuti",
  "Sakit",
  "Menikah"
];

List<String> listKategoriIzin2 = [
  "Izin Keluar",
  "Izin Pulang Cepat",
  "Izin Datang Terlambat",
  "Izin Keperluan Mendadak",
];