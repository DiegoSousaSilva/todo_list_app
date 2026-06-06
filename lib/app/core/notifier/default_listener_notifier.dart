import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:todo_list_app/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_app/app/core/ui/messages.dart';

class DefaultListenerNotifier {
  final DefaultChangeNotifier changeNotifier;
  VoidCallback? _currentListener;

  DefaultListenerNotifier({required this.changeNotifier});

  void listener({
    required BuildContext context,
    required SuccessVoidCallback successCallback,
    ErrorVoidCallback? errorCallback,
    EverCallback? everCallback,
  }) {
    _removeCurrentListener();

    _currentListener = () {
      if (everCallback != null) {
        everCallback(changeNotifier, this);
      }

      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }

      if (changeNotifier.hasError) {
        if (errorCallback != null) {
          errorCallback(changeNotifier, this);
        }
        Messages.of(context).showError(changeNotifier.error ?? "Erro interno");
      } else if (changeNotifier.isSuccess) {
        successCallback(changeNotifier, this);
      }
    };

    changeNotifier.addListener(_currentListener!);
  }

  void _removeCurrentListener() {
    if (_currentListener != null) {
      changeNotifier.removeListener(_currentListener!);
      _currentListener = null;
    }
  }

  void dispose() {
    _removeCurrentListener();
  }
}

typedef SuccessVoidCallback =
    void Function(
      DefaultChangeNotifier notifier,
      DefaultListenerNotifier listenerInstance,
    );

typedef ErrorVoidCallback =
    void Function(
      DefaultChangeNotifier notifier,
      DefaultListenerNotifier listenerInstance,
    );

typedef EverCallback =
    void Function(
      DefaultChangeNotifier notifier,
      DefaultListenerNotifier listenerInstance,
    );
