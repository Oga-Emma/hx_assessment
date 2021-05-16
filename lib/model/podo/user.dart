class User {
  var id;
  var email;
  var phonenumber;
  var username;
  var kycStatus;
  var emailVerified;
  var phoneNumberVerified;
  var active;
  var suspended;
  var createdAt;

  User.fromMap(Map<String, dynamic> data) {
    id = data["_id"];
    email = data["email"];
    phonenumber = data["phonenumber"];
    username = data["username"];
    kycStatus = data["kycStatus"];
    emailVerified = data["emailVerified"] ?? false;
    phoneNumberVerified = data["phoneNumberVerified"] ?? false;
    active = data["active"] ?? false;
    suspended = data["suspended"] ?? false;
    createdAt = data["createdAt"];
  }

  get initials => "$username".substring(0, 2);

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "email": email,
      "phonenumber": phonenumber,
      "username": username,
      "kycStatus": kycStatus,
      "emailVerified": emailVerified,
      "phoneNumberVerified": phoneNumberVerified,
      "active": active,
      "suspended": suspended,
      "createdAt": createdAt,
    };
  }

// phoneNumberDetails PhoneNumberDetails
  // role Role
  // profile Profile
  // userCard Card
  // kyc Kyc
  // paymentMethods [PaymentMethod]
}
