// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeview_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$stateListAtom =
      Atom(name: '_HomeViewModelBase.stateList', context: context);

  @override
  ObservableList<dynamic> get stateList {
    _$stateListAtom.reportRead();
    return super.stateList;
  }

  @override
  set stateList(ObservableList<dynamic> value) {
    _$stateListAtom.reportWrite(value, super.stateList, () {
      super.stateList = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void getData() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.getData');
    try {
      return super.getData();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateList: ${stateList}
    ''';
  }
}
