import 'package:flutter/material.dart';

enum ApiState { success, error, empty, none, loading, refresh, loadMore }

class ApiResult<T> {
  late ApiState state;
  late T? data;
  late String message;

  ApiResult({
    this.state = ApiState.none,
    this.data,
    this.message = "",
  });

  ApiResult<T> copyWidth({
    ApiState? state,
    T? data,
    String? message,
  }) {
    return ApiResult<T>(
      state: state ?? this.state,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  Widget when({
    Widget Function()? loading,
    required Widget Function(String) error,
    required Widget Function(T? data) success,
    Widget Function()? empty,
    Widget Function()? none,
    Widget Function()? refresh,
  }) {
    switch (this.state) {
      case ApiState.loading:
        return loading?.call() ??
            const Center(child: CircularProgressIndicator());
      case ApiState.error:
        return error(message);
      case ApiState.empty:
        return empty?.call() ?? const SizedBox();
      case ApiState.none:
        return none?.call() ?? const SizedBox();
      case ApiState.success:
        // if (data is List && (data as List).isEmpty) {
        //   return Center(
        //       child: Text(AppStrings.noDataAvailable,
        //           style: AppTextStyles.urbanistSemiBold.copyWith(
        //               color: AppColors.color212121,
        //               fontSize: Dimens.d14.responsiveWidth())));
        // }
        return success(data);
      case ApiState.refresh:
        return refresh?.call() ?? const SizedBox();
      default:
        return const SizedBox();
    }
  }

  void callBack({
    Function()? loading,
    Function(String)? error,
    Function(T? data)? success,
    Function()? empty,
    Function()? none,
    Function()? refresh,
    Function()? loadMore,
  }) {
    switch (this.state) {
      case ApiState.loading:
        loading?.call();
        break;
      case ApiState.error:
        error?.call(message);
        break;
      case ApiState.empty:
        empty?.call();
        break;
      case ApiState.none:
        none?.call();
        break;
      case ApiState.success:
        success?.call(data);
        break;
      case ApiState.refresh:
        refresh?.call();
        break;
      case ApiState.loadMore:
        loadMore?.call();
        break;
    }
  }
}
