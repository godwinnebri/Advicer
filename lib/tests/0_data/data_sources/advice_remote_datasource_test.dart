import 'package:adviser_app/0_data/data_sources/advice_remote_datasource.dart';
import 'package:adviser_app/0_data/models/advice_model.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:adviser_app/0_data/data_sources/advice_remote_datasource.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDataSource', () {
    group('should return advice model', () {
      test('when client response is 200 and has valid data', () async {
        final mockClient = Client();

        final adviceRemoteDataSourceUnderTest =
            AdviceRemoteDataSourceImpl(client: mockClient);
        const responseBody = '{"advice" : "test advice", "advice id" : 2}';

        when(
          mockClient.get(
            Uri.parse('https://api.flutter-community.com/api/v1/advice'),
            headers: {
              'content-type': 'application/json',
            },
          ),
        ).thenAnswer(
            (realInvocation) => Future.value(Response(responseBody, 200)));

        final result =
            await adviceRemoteDataSourceUnderTest.getRandomAdviseFromApi();
        expect(result, AdviceModel(advise: 'test advice', id: 1));
      });
    });
  });
}
