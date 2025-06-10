import 'package:dio/dio.dart';
import 'package:klaxon/infrastructure/models/bounty_model.dart'
    show BountyModel;

import '../../../presentation/values/values.dart';
import '../../models/contest_model.dart';
import '../../models/hackathon_model.dart';

class ContestHuntApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseAPI,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<ContestModel>> fetchContests({String? platform}) async {
    final response = await _dio.get(
      '/contests',
      queryParameters: platform != null ? {'platform': platform} : null,
    );
    final data = response.data as List;
    return data.map((e) => ContestModel.fromJson(e)).toList();
  }

  Future<List<HackathonModel>> fetchHackathons({String? platform}) async {
    final response = await _dio.get(
      '/hackathons',
      queryParameters: platform != null ? {'platform': platform} : null,
    );
    final data = response.data as List;
    return data.map((e) => HackathonModel.fromJson(e)).toList();
  }

  Future<List<BountyModel>> fetchBounties({String? platform}) async {
    final response = await _dio.get(
      '/bounties',
      queryParameters: platform != null ? {'platform': platform} : null,
    );
    final data = response.data as List;
    return data.map((e) => BountyModel.fromJson(e)).toList();
  }
}
