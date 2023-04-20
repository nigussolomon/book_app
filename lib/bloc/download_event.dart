part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class DownloadBook extends DownloadEvent {
  final Book book;
  const DownloadBook({required this.book});

  @override
  List<Object> get props => [];

  get bookVal => book;
}

class ViewBook extends DownloadEvent {
  final Book book;
  const ViewBook({required this.book});

  @override
  List<Object> get props => [];

  get bookVal => book;
}

class CheckDownload extends DownloadEvent {
  final Book book;
  const CheckDownload({required this.book});
  @override
  List<Object> get props => [];
  get data => book;
}

class History extends DownloadEvent {}
