import 'dart:io';

import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';

class PackageService {

  handlerMessage(int id) {
    _download(id);
  }

  _download(int id) async {
    print(">> Download ... $id");
    _getLocalFile();
    var _downloadData = List<int>();
    HttpClient client = new HttpClient();
    await client
        .getUrl(Uri.parse("http://192.168.100.124:8080/images/get-file/$id"))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.listen((d) => _downloadData.addAll(d), onDone: () {
        _unzip(_downloadData);
      });
      //response.pipe(new File(directory.path+"/400.zip").openWrite()).whenComplete(_unzip);
    });
  }

  void _unzip(List<int> bytes) async {
    print(">> _unzip ...");
    // Read the Zip file from disk.
    final directory = await getApplicationDocumentsDirectory();

    // Decode the Zip file
    Archive archive = ZipDecoder().decodeBytes(bytes);
    // Extract the contents of the Zip archive to disk.
    for (ArchiveFile file in archive) {
      String filename = file.name;
      if (file.isFile) {
        List<int> data = file.content;
        File(directory.path + "/packages/" + filename)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory(directory.path + "/packages/" + filename)
          ..create(recursive: true);
      }
    }

  }
  // /data/user/0/com.reino.fireapp/app_flutter/packages/400/small/small_casa_moderna.jpg
  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();

    bool fsp = await Directory("${directory.path}/packages").exists();

    if(fsp == false){
      print("PS Is empty directore packages");
    }

    Stream<FileSystemEntity> fs = directory.list(recursive: true);
    fs.forEach((data){
      print("PS _getLocalFile path: ${data.path}");
      print("PS _getLocalFile exist: ${data.exists()}");
    });
  }
}
