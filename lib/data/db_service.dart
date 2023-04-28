import 'downloads.dart';
import 'local_db.dart';

class ServiceLocal {
  Repository? _repository;

  ServiceLocal() {
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
