import 'package:hagglex/data/config/graphql_config.dart';
import 'package:hagglex/data/remote/repository/auth_repo.dart';
import 'package:simple_gql/simple_gql.dart';

class AuthRepoImpl extends GraphQlConfig implements AuthRepo {
  @override
  Future login(String email, String password) async {
    var mutation = r'''
    mutation userLogin($data: LoginInput!) {
      login(data: $data){
      user {
        _id
      },
      token,
      twoFactorAuth,
    }
  }
    ''';
    var response = await mutate(mutation: mutation, variables: {
      "data": {"input": email, "password": password}
    });
  }
}
