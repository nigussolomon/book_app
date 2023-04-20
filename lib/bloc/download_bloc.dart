import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';

import '../data/Api_service.dart';
import '../data/book.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
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
        emit(DownloadSuccess(
            downloaded: true, path: file.path, history: history));
      } catch (e) {
        DownloadInitial();
      }
    });

    on<CheckDownload>((event, emit) async {
      emit(DownloadLoading());
      bool pass = false;
      final downloadId = await Service.getDownloadedBooks();
      if (downloadId["downloads"] != "No downloads found") {
        for (var element in downloadId["downloads"]) {
          if (element["bookname"] == event.data.bookName) {
            pass = true;
            try {
              final appDir = await getExternalStorageDirectory();
              final file = File('${appDir?.path}/${event.data.bookName}');
              emit(DownloadSuccess(
                  downloaded: true, path: file.path, history: history));
            } catch (e) {
              emit(DownloadInitial());
            }
          }
        }

        if (pass == false) {
          emit(DownloadInitial());
        }
      } else {
        emit(DownloadInitial());
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
      emit(DownloadSuccess(downloaded: true, path: '', history: history));
    });
  }
}
