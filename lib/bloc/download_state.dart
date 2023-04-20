part of 'download_bloc.dart';

abstract class DownloadState extends Equatable {
  const DownloadState();

  @override
  List<Object> get props => [];
}

class DownloadInitial extends DownloadState {}

class DownloadLoading extends DownloadState {}

class DownloadSuccess extends DownloadState {
  final bool downloaded;
  final String path;
  final List history;

  const DownloadSuccess(
      {required this.downloaded, required this.path, required this.history});
}
