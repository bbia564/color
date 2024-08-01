import 'package:color_extractor/app/data/copy_details_model.dart';
import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CEDatabaseService extends GetxService {
  late Database db;

  Future<CEDatabaseService> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'copy_details.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await _createDBTable(db);
    });

  }

  _createDBTable(Database db) async {
    final red = DBTableName.red.dbName;
    final blue = DBTableName.blue.dbName;
    final greenName = DBTableName.green.dbName;
    print("!!!!!! ${red} $blue  $greenName");
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $red (id INT AUTO_INCREMENT PRIMARY KEY, colorName TEXT,time TEXT)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $blue (id INT AUTO_INCREMENT PRIMARY KEY, colorName TEXT,time TEXT)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $greenName (id INT AUTO_INCREMENT PRIMARY KEY, colorName TEXT,time TEXT)');
  }

  insertModel(CopyDetailsModel model,
      {DBTableName dbTableName = DBTableName.red}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'copy_details.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    await db.insert(dbTableName.dbName, {
      'colorName': model.colorName,
      'time': model.time,
    });
  }

  updateWithModel(CopyDetailsModel model) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'copy_details.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.update(
        'copy_details',
        {
          'colorName': model.colorName,
          'time': model.time,
        },
        where: 'id = ?',
        whereArgs: [
          model.id,
        ]);
  }

  delete(int id) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'copy_details.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    db.delete('copy_details', where: 'id = ?', whereArgs: [id]);
  }

  cleanAll({DBTableName dbTableName = DBTableName.red}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'copy_details.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.delete(dbTableName.dbName);
  }

  Future<List<CopyDetailsModel>> getAllDetails(
      {DBTableName dbTableName = DBTableName.red}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'copy_details.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query(dbTableName.dbName, orderBy: 'id ASC');
    return result.map((e) => CopyDetailsModel.fromJson(e)).toList();
  }
}
