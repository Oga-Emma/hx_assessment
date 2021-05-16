import 'package:simple_gql/simple_gql.dart';

class GraphQlConfig {
  final baseUrl = "https://hagglex-backend-staging.herokuapp.com/graphql";
  GQLClient client;
  GraphQlConfig() {
    client = GQLClient(baseUrl);
  }

  Future<GQLResponse> query(
      {String query,
      Map<String, dynamic> variables,
      Map<String, dynamic> headers}) async {
    try {
      return await client.query(
          query: query, variables: variables, headers: headers);
    } on GQLError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<GQLResponse> mutate(
      {String mutation,
      Map<String, dynamic> variables,
      Map<String, dynamic> headers}) async {
    try {
      return await client.mutation(
          mutation: mutation, variables: variables, headers: headers);
    } on GQLError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
