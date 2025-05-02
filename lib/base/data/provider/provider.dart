library;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodmate/base/data/helper/helper.dart';
import 'package:provider/single_child_widget.dart';

import '../models/models.dart';

part "repositories.dart";
part "bloc.providers.dart";

// cubits
part "cubit/nav.cubit.dart";

// bloc
part "bloc/auth.bloc.dart";
part "bloc/quote.bloc.dart";

// states
part "states/auth.states.dart";
part "states/quote.state.dart";

// events
part "events/auth.events.dart";
part "events/quote.events.dart";

// repos
part "repo/auth.repo.dart";
part "repo/quote.repo.dart";
