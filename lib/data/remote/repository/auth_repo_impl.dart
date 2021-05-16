import 'package:hagglex/data/config/graphql_config.dart';
import 'package:hagglex/data/remote/repository/auth_repo.dart';
import 'package:hagglex/model/podo/auth_response.dart';
import 'package:simple_gql/simple_gql.dart';

class AuthRepoImpl extends GraphQlConfig implements AuthRepo {
  @override
  Future<AuthResponse> login(String email, String password) async {
    var mutation = r'''
    mutation userLogin($data: LoginInput!) {
      login(data: $data){
      user {
        _id,
        email,
        phonenumber,
        username,
        kycStatus,
        emailVerified,
        phoneNumberVerified,
        active,
        suspended,
        createdAt
      },
      token,
      twoFactorAuth,
    }
  }
    ''';
    var response = await mutate(mutation: mutation, variables: {
      "data": {"input": email, "password": password}
    });

    return AuthResponse.fromMap(response.data['login']);
  }

  @override
  Future<AuthResponse> register(Map<String, dynamic> data) async {
    var mutation = r'''
    mutation userRegistration($data: CreateUserInput!) {
      register(data: $data){
        user{
            _id,
            email,
            phonenumber,
            username,
            kycStatus,
            emailVerified,
            phoneNumberVerified,
            active,
            suspended,
            createdAt
          },
          token
      }
  }
    ''';
    var response = await mutate(mutation: mutation, variables: {"data": data});

    return AuthResponse.fromMap(response.data['register']);
  }
}
