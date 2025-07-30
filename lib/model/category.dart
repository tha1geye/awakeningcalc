import 'package:uuid/uuid.dart';

class Category {
  late String id;
  String title;
  late List<String> children;
  bool hasItemChildren;
  bool isTopLevel;

  Category({String? id, List<String>? children, required this.title, required this.hasItemChildren, this.isTopLevel = false}){
    this.id = id ?? const Uuid().v4();
    this.children = children ?? [];
  }

  void addChildren(List<String> children){
    for(String child in children){
      this.children.add(child);
    }
  }

  void addChild(String child){
    children.add(child);
  }

  List<String> getChildren(){
    return children;
  }
}