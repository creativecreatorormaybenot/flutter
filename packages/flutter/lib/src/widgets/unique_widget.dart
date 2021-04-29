// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'framework.dart';

/// Base class for stateful widgets that have exactly one inflated instance in
/// the tree.
///
/// Such widgets must be given a [GlobalKey]. This key can be generated by the
/// subclass from its [Type] object, e.g. by calling `super(key: new
/// GlobalObjectKey(MyWidget))` where `MyWidget` is the name of the subclass.
///
/// Since only one instance can be inflated at a time, there is only ever one
/// corresponding [State] object. That object is exposed, for convenience, via
/// the [currentState] property.
///
/// When subclassing [UniqueWidget], provide the corresponding [State] subclass
/// as the type argument.
abstract class UniqueWidget<T extends State<StatefulWidget>> extends StatefulWidget {
  /// Creates a widget that has exactly one inflated instance in the tree.
  ///
  /// The [key] argument must not be null because it identifies the unique
  /// inflated instance of this widget.
  const UniqueWidget({
    required GlobalKey<T> key,
  }) : super(key: key);

  @override
  T createState(); // ignore: no_logic_in_create_state, https://github.com/dart-lang/linter/issues/2345

  /// The state for the unique inflated instance of this widget.
  ///
  /// Might be null if the widget is not currently in the tree.
  T? get currentState {
    final GlobalKey<T> globalKey = key! as GlobalKey<T>;
    return globalKey.currentState;
  }
}
