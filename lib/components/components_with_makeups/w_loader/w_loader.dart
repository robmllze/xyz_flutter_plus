//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_loader_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_LOADER_PARAMETERS = {
  "backgroundColor": "Color?",
  "color": "Color?",
  "errorColor": "Color?",
  "size": "double?",
  "strokeWidth": "double?",
  "successColor": "Color?",
  "valueColor": "Animation<Color?>?",
};

@GenerateMakeups(parameters: W_LOADER_PARAMETERS)
class WLoader extends StatelessWidget {
  //
  //
  //

  final WLoaderMakeup? makeup;

  //
  //
  //

  const WLoader({
    Key? key,
    this.makeup,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    return Center(
      child: SizedBox.square(
        dimension: this.makeup?.size,
        child: CircularProgressIndicator(
          color: this.makeup?.color,
          backgroundColor: this.makeup?.backgroundColor,
          valueColor: this.makeup?.valueColor,
          strokeWidth: this.makeup?.strokeWidth ?? $4,
        ),
      ),
    );
  }
}
