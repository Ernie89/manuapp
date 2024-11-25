import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'video_player_manu_model.dart';
export 'video_player_manu_model.dart';

class VideoPlayerManuWidget extends StatefulWidget {
  const VideoPlayerManuWidget({super.key});

  @override
  State<VideoPlayerManuWidget> createState() => _VideoPlayerManuWidgetState();
}

class _VideoPlayerManuWidgetState extends State<VideoPlayerManuWidget> {
  late VideoPlayerManuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayerManuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
