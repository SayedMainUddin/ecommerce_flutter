class IndexPath {
  /// The the number of the section.
  final int section;

  /// The the number of the row in the [section].
  final int index;

  /// The Class that contains the [section] number
  /// and the [index] number in this section.
  IndexPath({required this.section, required this.index});
}
class ListItem {
  final IndexPath indexPath;
  final ListItemType type;

  ListItem({required this.indexPath, required this.type});
}
enum ListItemType { section, itemSeparator, sectionSeparator, item }

extension PageTypeExtension on ListItemType {
  bool get isItem => this == ListItemType.item;

  bool get isSection => this == ListItemType.section;

  bool get isItemSeparator => this == ListItemType.itemSeparator;

  bool get isSectionSeparator => this == ListItemType.sectionSeparator;
}