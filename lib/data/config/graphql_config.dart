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
      Map<String, String> headers}) async {
    try {
      final res = await client.query(
          query: query, variables: variables, headers: headers);
      return handleErrors(res);
    } on GQLError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<GQLResponse> mutate(
      {String mutation,
      Map<String, dynamic> variables,
      Map<String, String> headers}) async {
    try {
      final res = await client.mutation(
          mutation: mutation, variables: variables, headers: headers);

      return handleErrors(res);
    } on GQLError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  //Todo: abstract error handling here
  Future<GQLResponse> handleErrors(GQLResponse res) async {
    return res;
  }
}
