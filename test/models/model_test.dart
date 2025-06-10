import 'package:flutter_test/flutter_test.dart';
import 'package:klaxon/infrastructure/models/bounty_model.dart';
import 'package:klaxon/infrastructure/models/contest_model.dart';
import 'package:klaxon/infrastructure/models/hackathon_model.dart';

void main() {
  group('ContestModel', () {
    test('fromJson and toJson should work properly', () {
      const json = {
        "created_at": "2025-01-21T13:03:52.586838+00:00",
        "description": "A flagship event",
        "duration": 97200,
        "end_time": 1738222200,
        "id": 5,
        "name": "TSEC HACKS 2025",
        "platform": "devfolio",
        "start_time": 1738125000,
        "url": "https://tsec-hacks-2025.devfolio.co/",
      };

      final model = ContestModel.fromJson(json);
      expect(model.name, "TSEC HACKS 2025");
      expect(model.toJson(), json);
    });
  });

  group('HackathonModel', () {
    test('fromJson and toJson should work properly', () {
      const json = {
        "created_at": "2025-01-21T13:03:52.586838+00:00",
        "description": "A flagship event",
        "duration": 97200,
        "end_time": 1738222200,
        "id": 5,
        "mode": "offline",
        "name": "TSEC HACKS 2025",
        "platform": "devfolio",
        "start_time": 1738125000,
        "url": "https://tsec-hacks-2025.devfolio.co/",
      };

      final model = HackathonModel.fromJson(json);
      expect(model.mode, "offline");
      expect(model.toJson(), json);
    });
  });

  group('BountyModel', () {
    test('fromJson and toJson should work properly', () {
      const json = {
        "amount": 50,
        "created_at": "2025-03-29T04:41:37.804424+00:00",
        "description": "Problem Description: Receiving the following error...",
        "duration": 299838,
        "end_time": 1743379200,
        "id": 31,
        "name": "Debugging a PostgreSQL issue",
        "paid": null,
        "platform": "replit",
        "start_time": 1743079361,
        "url": "https://replit.com/bounties/debugging-a-postgres",
      };

      final model = BountyModel.fromJson(json);
      expect(model.amount, 50);
      expect(model.paid, null);
      expect(model.toJson(), json);
    });
  });
}
