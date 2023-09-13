import 'package:flutter/material.dart';

void main() {
  final TreeNode<int> root = TreeNode<int>(1)
    ..left = TreeNode<int>(1)
    ..right = TreeNode<int>(3)
    ..left!.left = TreeNode<int>(4)
    ..left!.right = TreeNode<int>(5);

  runApp(MyApp(root: root));
}

class TreeNode<T> {
  T data;
  TreeNode<T>? left;
  TreeNode<T>? right;

  TreeNode(this.data);
}

class MyApp extends StatelessWidget {
  final TreeNode<int> root;

  const MyApp({required this.root});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Binary Tree Traversal in Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TraversalResult(
                title: 'Inorder Traversal:',
                traversalFunction: (node, result) =>
                    inorderTraversal(node, result),
                root: root,
              ),
              TraversalResult(
                title: 'Preorder Traversal:',
                traversalFunction: (node, result) =>
                    preorderTraversal(node, result),
                root: root,
              ),
              TraversalResult(
                title: 'Postorder Traversal:',
                traversalFunction: (node, result) =>
                    postorderTraversal(node, result),
                root: root,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TraversalResult extends StatelessWidget {
  final String title;
  final void Function(TreeNode<int>?, List<int>) traversalFunction;
  final TreeNode<int> root;

  TraversalResult({
    required this.title,
    required this.traversalFunction,
    required this.root,
  });

  @override
  Widget build(BuildContext context) {
    final List<int> result = [];
    traversalFunction(root, result);

    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          result.join(' - '),
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

void inorderTraversal(TreeNode<int>? node, List<int> result) {
  if (node == null) {
    return;
  }

  inorderTraversal(node.left, result);
  result.add(node.data);
  inorderTraversal(node.right, result);
}

void preorderTraversal(TreeNode<int>? node, List<int> result) {
  if (node == null) {
    return;
  }

  result.add(node.data);
  preorderTraversal(node.left, result);
  preorderTraversal(node.right, result);
}

void postorderTraversal(TreeNode<int>? node, List<int> result) {
  if (node == null) {
    return;
  }

  postorderTraversal(node.left, result);
  postorderTraversal(node.right, result);
  result.add(node.data);
}
