// linked_list.dart

class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data);
}

class LinkedList<T> {
  Node<T>? head;

  void insert(T data) {
    final newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      Node<T>? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  bool remove(T data) {
    if (head == null) {
      return false; // List is empty
    }

    if (head!.data == data) {
      head = head!.next;
      return true;
    }

    Node<T>? current = head;
    while (current!.next != null) {
      if (current.next!.data == data) {
        current.next = current.next!.next;
        return true;
      }
      current = current.next;
    }

    return false; // Data not found
  }

  List<T> toList() {
    final List<T> list = [];
    Node<T>? current = head;
    while (current != null) {
      list.add(current.data);
      current = current.next;
    }
    return list;
  }
}
