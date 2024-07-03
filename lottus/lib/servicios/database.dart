import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Categorias (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE Marcas (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE Clientes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          correo_electronico TEXT,
          direccion TEXT,
          telefono TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE Productos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          descripcion TEXT,
          precio REAL,
          stock INTEGER,
          categoria_id INTEGER,
          marca_id INTEGER,
          fecha_agregado TEXT,
          FOREIGN KEY (categoria_id) REFERENCES Categorias(id),
          FOREIGN KEY (marca_id) REFERENCES Marcas(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE Pedidos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          cliente_id INTEGER,
          fecha TEXT,
          total REAL,
          FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE Detalle_Pedido (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          pedido_id INTEGER,
          producto_id INTEGER,
          cantidad INTEGER,
          precio_unitario REAL,
          FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
          FOREIGN KEY (producto_id) REFERENCES Productos(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE users ADD COLUMN password TEXT');
    }
  }

  Future<void> insertTestData() async {
    var db = await database;
    await db.insert('Categorias', {'nombre': 'Electrónica'});
    await db.insert('Marcas', {'nombre': 'Samsung'});
    await db.insert('Clientes', {
      'nombre': 'Juan Pérez',
      'correo_electronico': 'juan.perez@example.com',
      'direccion': '123 Calle Falsa',
      'telefono': '123456789'
    });
    await db.insert('Productos', {
      'nombre': 'Smartphone',
      'descripcion': 'Un smartphone de alta gama',
      'precio': 699.99,
      'stock': 50,
      'categoria_id': 1,
      'marca_id': 1,
      'fecha_agregado': '2023-01-01'
    });
    await db.insert(
        'Pedidos', {'cliente_id': 1, 'fecha': '2023-01-10', 'total': 699.99});
    await db.insert('Detalle_Pedido', {
      'pedido_id': 1,
      'producto_id': 1,
      'cantidad': 1,
      'precio_unitario': 699.99
    });
  }

  Future<void> testDatabase() async {
    var db = await database;
    print('Base de datos inicializada: $db');

    // Insertar datos de prueba
    await insertTestData();

    // Leer datos de prueba
    var result = await db.query('Productos');
    print('Datos de prueba insertados en Productos: $result');

    result = await db.query('Categorias');
    print('Datos de prueba insertados en Categorias: $result');

    result = await db.query('Marcas');
    print('Datos de prueba insertados en Marcas: $result');

    result = await db.query('Clientes');
    print('Datos de prueba insertados en Clientes: $result');

    result = await db.query('Pedidos');
    print('Datos de prueba insertados en Pedidos: $result');

    result = await db.query('Detalle_Pedido');
    print('Datos de prueba insertados en Detalle_Pedido: $result');
  }

  Future<bool> authenticateUser(String username, String password) async {
    var db = await database;
    var result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  Future<void> registerUser(String username, String password) async {
    var db = await database;
    await db.insert('users', {'username': username, 'password': password});
  }
}
