import 'package:elektronik_disposisi_management/model/cutom_marker_model.dart';
import 'package:elektronik_disposisi_management/model/user_model.dart';
import 'package:supabase/supabase.dart' as supabase;

class Services {
  final _client = supabase.SupabaseClient(
      'https://sdjjiccjylhaxkyqwvnc.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkamppY2NqeWxoYXhreXF3dm5jIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY0NTU4NjY2MiwiZXhwIjoxOTYxMTYyNjYyfQ.kCQA3towP9hzp2uXZywhyDQELBDjBt9EmTyGnhWreIo');
  // Future<List<CustomMarkerModel>> getData() async {
  //   _client.from('disposisi')
  // }

  Future<List<User>> getUser() async {
    List<User> user = [];
    var availableUser =
        await _client.from('users').select().eq("isAvailable", true).execute();
    // print(availableUser.data);
    for (var item in availableUser.data) {
      user.add(User.fromMap(item));
    }
    return user;
  }
}
