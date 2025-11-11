import 'package:flutter/material.dart';

class FilterDropdown extends StatefulWidget {
  final String selectedFilter;
  final List<Map<String, String>> filterOptions;
  final Function(String) onFilterSelected;

  const FilterDropdown({
    super.key,
    required this.selectedFilter,
    required this.filterOptions,
    required this.onFilterSelected,
  });

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  bool isFilterOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFilterOpen = !isFilterOpen;
          });
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF262828)
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF777C7C).withOpacity(0.3)
                      : const Color(0xFF5E5240).withOpacity(0.12),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.tune,
                        size: 20,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFFF5F5F5)
                            : const Color(0xFF13343B),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.selectedFilter,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFFF5F5F5)
                              : const Color(0xFF13343B),
                        ),
                      ),
                    ],
                  ),
                  AnimatedRotation(
                    turns: isFilterOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 150),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFFA7A9A9).withOpacity(0.7)
                          : const Color(0xFF626C71),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              height: isFilterOpen ? null : 0,
              child: isFilterOpen
                  ? Container(
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF262828)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF777C7C).withOpacity(0.2)
                              : const Color(0xFF5E5240).withOpacity(0.12),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          children: widget.filterOptions.asMap().entries.map((entry) {
                            final index = entry.key;
                            final option = entry.value;
                            final value = option['value']!;
                            final label = option['label']!;
                            final isSelected = widget.selectedFilter == label;
                            final isLast = index == widget.filterOptions.length - 1;

                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  widget.onFilterSelected(label);
                                  setState(() {
                                    isFilterOpen = false;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? (Theme.of(context).brightness == Brightness.dark
                                                ? const Color(0xFF32B8C6).withOpacity(0.15)
                                                : const Color(0xFF21808D).withOpacity(0.12))
                                        : Colors.transparent,
                                    border: !isLast
                                        ? Border(
                                            bottom: BorderSide(
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? const Color(0xFF777C7C).withOpacity(0.15)
                                                  : const Color(0xFF5E5240).withOpacity(0.12),
                                              width: 1,
                                            ),
                                          )
                                        : null,
                                  ),
                                  child: Text(
                                    label,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                                      color: isSelected
                                          ? (Theme.of(context).brightness == Brightness.dark
                                                  ? const Color(0xFF32B8C6)
                                                  : const Color(0xFF21808D))
                                          : (Theme.of(context).brightness == Brightness.dark
                                                  ? const Color(0xFFF5F5F5)
                                                  : const Color(0xFF13343B)),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

