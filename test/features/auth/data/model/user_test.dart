import 'package:flutter_test/flutter_test.dart';
import 'package:food_ninja/features/auth/data/model/user.dart';

void main() {
  group('AuthedUser', () {
    const authedUser = AuthedUser(
      id: '123',
      name: 'Nadin Ahmed',
      email: 'nadinahmed@example.com',
    );

    test('toMap should return a correct map', () {
      final expectedMap = {
        'id': '123',
        'name': 'Nadin Ahmed',
        'email': 'nadinahmed@example.com',
      };

      expect(authedUser.toMap(), expectedMap);
    });

    test('fromMap should return a valid AuthedUser object', () {
      final map = {
        'id': '123',
        'name': 'Nadin Ahmed',
        'email': 'nadinahmed@example.com',
      };

      final result = AuthedUser.fromMap(map);

      expect(result.id, '123');
      expect(result.name, 'Nadin Ahmed');
      expect(result.email, 'nadinahmed@example.com');
    });

    test('toString should return the correct string representation', () {
      const expectedString =
          'AuthedUser{id: 123, name: Nadin Ahmed, email: nadinahmed@example.com}';
      expect(authedUser.toString(), expectedString);
    });
  });
}
