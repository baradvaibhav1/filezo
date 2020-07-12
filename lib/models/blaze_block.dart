import 'package:fileexplorer/enums/block_type.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';

class BlazeBlock {
  String name;
  List<BlazeFileEntity> list = [];
  BlockType blockType;
  String timestamp = "1970-01-01T00:00:00+00:00";
  int fileCount = 0;

  BlazeBlock(this.name, {this.blockType = BlockType.DateWise});

  Future addFile(BlazeFileEntity file) async {
    await list.add(file);

    if (file.timestamp.compareTo(timestamp) > 0) timestamp = file.timestamp;

    await fileCount++;

    return;
  }
}
