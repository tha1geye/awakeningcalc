abstract class SubsetStorageControllerInterface<T> {
  Future<List<T>?> getList() {
    throw UnimplementedError();
  }

  Future<T> get(int id) {
    throw UnimplementedError();
  }

  update(T object) {
    throw UnimplementedError();
  }

  insert(T object) {
    throw UnimplementedError();
  }

  delete(T object) {
    throw UnimplementedError();
  }
}
