enum StatusCode {
  errorEncryptedData(24381),
  zero(0),
  success(1),
  missingData(2),
  notPermission(3),
  notSuccess(4),
  unknown(5),
  operationFailed(6),
  notEmployeeSchool(7),
  notUseAttendance(8),
  errorFaceRecognition(10),
  notFaceRecognition(11),
  notFoundFace(12),
  notRegisterFace(13),
  notFoundStudent(14),
  notFoundUser(101),
  tokenExpired(102),
  invalidToken(103),
  errorToken(104),
  notFoundToken(105),
  userLocked(301),
  userNotPermissionAttendance(302),
  invalidPassword(303),
  userNotExist(304),
  userNotField(305),
  notFoundAccount(306),
  notAuthenticator(401),
  notFindStudent(402),
  notFindStudentInList(403),
  notFound(404),
  existedFace(501),
  errorAsyncAws(601),
  errorRegisterFaceRecognition(602),
  errorDate(702),
  errorStudentNotAttendance(707),
  errorStudentAddParent(801),
  notParentOfStudent(802),
  notFoundParent(803),
  ;

  const StatusCode(this.value);

  final int value;

  static StatusCode of(int? value) {
    return StatusCode.values.firstWhere(
      (element) => element.value == value,
      orElse: () => StatusCode.unknown,
    );
  }
}
