class MyQueue<T> {
  final List<T> _storage = [];

  // 添加元素到队列尾部
  void enqueue(T element) {
    _storage.add(element);
  }

  void enqueueIsExist(T element) {
    _storage.add(element);
  }

  // 移除队列头部的元素并返回它
  T? dequeue() {
    if (isEmpty) {
      // throw Exception('Queue is empty.');
      return null;
    }
    T removedElement = _storage.first;
    _storage.removeAt(0);
    return removedElement;
  }

  // 返回队列头部的元素而不移除
  T? peek() {
    if (isEmpty) {
      // throw Exception('Queue is empty.');
      return null;
    }
    return _storage.first;
  }

  bool removeFirst() {
    if (isEmpty) {
      // throw Exception('Queue is empty.');
      return false;
    }
    _storage.removeAt(0);
    return true;
  }

  List<T> storageQueue() {
    if (isEmpty) {
      throw Exception('Queue is empty.');
    }
    return _storage;
  }

  void clearEnqueue() {
    if (isEmpty) {
      throw Exception('Queue is empty.');
    }
    _storage.clear();
  }

  // 检查队列是否为空
  bool get isEmpty => _storage.isEmpty;

  // 获取队列中元素的数量
  int get length => _storage.length;
}