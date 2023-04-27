import 'downloads.dart';
import 'local_db.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  savedownload(Download download) async {
    return await _repository!.insertData('download', download.toJson());
  }

  readdownload() async {
    return await _repository!.readData('download');
  }

  deletedownload(dispatchId) async {
    return await _repository!.deleteData('download', dispatchId);
  }

  wipeDate() async {
    await _repository!.deleteAllData('download');
  }
}
