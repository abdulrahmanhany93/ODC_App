part of 'appdata_cubit.dart';

@immutable
abstract class AppdataState {}

class AppdataInitial extends AppdataState {}

class FetchingData extends AppdataState {}

class DataFetched extends AppdataState {}

class DataFetchError extends AppdataState {}
