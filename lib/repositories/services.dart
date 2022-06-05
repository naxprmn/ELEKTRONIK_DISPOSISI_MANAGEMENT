import 'package:elektronik_disposisi_management/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase/supabase.dart' as supabase;

final databaseProvider = Provider<Services>((ref) => Services());

class Services {
  final _client = supabase.SupabaseClient('https://sdjjiccjylhaxkyqwvnc.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkamppY2NqeWxoYXhreXF3dm5jIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTQxNTcxMzEsImV4cCI6MTk2OTczMzEzMX0.x1IiVZStzlhWLaV3WASdbGFrf1CuUHhvY73YgYKACG0');
  // Future<List<CustomMarkerModel>> getData() async {
  //   _client.from('disposisi')
  // }

  Future<List<User>> getUser() async {
    List<User> user = [];
    var availableUser = await _client.from('users').select().eq("isAvailable", true).execute();
    print(availableUser.data);
    print(availableUser.error);
    // print(availableUser.data);
    if (availableUser.data != null) {
      for (var item in availableUser.data) {
        user.add(User.fromMap(item));
      }
    }
    return user;
  }
}
