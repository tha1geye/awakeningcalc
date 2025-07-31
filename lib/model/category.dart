import 'package:uuid/uuid.dart';

class Category {
  late int id;
  String title;
  late List<int> children;
  bool hasItemChildren;
  bool isTopLevel;

  Category({int? id, List<int>? children, required this.title, required this.hasItemChildren, this.isTopLevel = false}){
    this.id = id ?? -1;
    this.children = children ?? [];
  }

  void addChildren(List<int> children){
    for(int child in children){
      this.children.add(child);
    }
  }

  void addChild(int child){
    children.add(child);
  }

  List<int> getChildren(){
    return children;
  }
}