import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:book_app/data/downloads.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';

import '../data/Api_service.dart';
import '../data/book.dart';
import '../data/db_service.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  ServiceLocal sl = ServiceLocal();
  DownloadBloc() : super(DownloadInitial()) {
    // String path = '';
    List history = [];
    on<DownloadBook>((event, emit) async {
      emit(DownloadLoading());
      try {
        final downloadId = await Service.downloadBook(event.bookVal.id);
        if (downloadId["message"] != "Books already downloaded") {
          Service.getDownloadedBook(downloadId["id"], event.bookVal.bookName);
        }
        final appDir = await getExternalStorageDirectory();
        final file = File('${appDir?.path}/${event.bookVal.bookName}');
        final local = Download(
            book_id: event.bookVal.id, user_id: event.bookVal.authorId);
        sl.savedownload(local);
        print(file.path);
        await Future.delayed(const Duration(seconds: 3));
        emit(DownloadSuccess(
            downloaded: true, path: file.path, history: history));
      } catch (e) {
        DownloadInitial();
      }
    });

    on<ViewBook>((event, emit) async {
      emit(DownloadLoading());
      try {
        final appDir = await getExternalStorageDirectory();
        final file = File('${appDir?.path}/${event.bookVal.bookName}');
        await Future.delayed(const Duration(seconds: 3));
        emit(DownloadSuccess(
            downloaded: true, path: file.path, history: history));
      } catch (e) {
        DownloadInitial();
      }
    });

    on<CheckDownload>((event, emit) async {
      final downloadId = await Service.getDownloadedBooks();
      if (downloadId['downloads'] == 'No downloads found') {
        sl.wipeDate();
      }
      emit(DownloadLoading());
      bool pass = false;
      await sl.readdownload().then((val) => {
            print(val),
            for (var element in val)
              {
                if (element['book_id'] == event.data.id)
                  {
                    pass = true,
                  }
              }
          });

      if (pass == false) {
        emit(DownloadInitial());
      } else {
        try {
          final appDir = await getExternalStorageDirectory();
          final file = File('${appDir?.path}/${event.data.bookName}');

          emit(DownloadSuccess(
              downloaded: true, path: file.path, history: history));
        } catch (e) {
          emit(DownloadInitial());
        }
      }
    });

    on<History>((event, emit) async {
      history.clear();
      emit(DownloadLoading());
      final downloadId = await Service.getDownloadedBooks();
      if (downloadId["downloads"] != "No downloads found") {
        for (var element in downloadId["downloads"]) {
          history.add(element);
        }
      }
      print(history);
      emit(DownloadSuccess(downloaded: true, path: '', history: history));
    });
  }
}
