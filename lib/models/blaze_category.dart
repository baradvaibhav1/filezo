import 'package:fileexplorer/enums/file_categories.dart';
import 'package:fileexplorer/models/blaze_block.dart';
import 'package:fileexplorer/models/blaze_file_entity.dart';

class BlazeCategory {
  FileCategory category;
  String name;
  List<BlazeBlock> blockList = [];
  List<BlazeBlock> dateWiseList = [];
  List<BlazeFileEntity> fileList = [];
  int filesCount = 0;

  BlazeCategory(
    this.category, {
    this.name,
  });

  addFile(BlazeFileEntity fileEntity)async{
    fileList.add(fileEntity);

    filesCount++;
  }

  sortFiles() async
  {
    fileList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    blockList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    blockList.forEach((element) {
      element.list.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    });

    dateWiseList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    dateWiseList.forEach((element) {
      element.list.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    });
  }
}
