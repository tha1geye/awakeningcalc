abstract class StorageTypeInterface<T> {
  Future<List<T>?> getList() async {
    throw UnimplementedError();
  }

  Future<T?> get(int id) async {
    throw UnimplementedError();
  }

  Future<T> insert(T object) async {
    throw UnimplementedError();
  }

  Future delete(T object) async {
    throw UnimplementedError();
  }

  Future update(T object) async {
    throw UnimplementedError();
  }
}
