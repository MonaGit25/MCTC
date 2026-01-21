import 'package:ecommerce_app/utilities/input_decorations.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  final VoidCallback onContinue;
  final VoidCallback goToRequisitionTab;

  const ShopPage({
    super.key,
    required this.onContinue,
    required this.goToRequisitionTab,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isManual = true; // toggle state
  String? requisitionType; //Dropdown
  String? selectPort;
  DateTime? selectedDate;

  void _openRequisitionTypeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _requisitionOption("Standard Provision Requisition"),
            _requisitionOption("Regional Provision Requisition"),
            _requisitionOption("Bonded Requisition"),
            _requisitionOption("Equipment & Utensils Requisition"),
            _requisitionOption("Consumables Requisition"),
          ],
        );
      },
    );
  }

  void _openPortSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _portOption("Port of Rotterdam – Netherlands"),
            _portOption("Port of Singapore – Singapore"),
            _portOption("Port of Shanghai – China"),
            _portOption("Port of Hamburg – Germany"),
            _portOption("Port of Fujairah – United Arab Emirates"),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Requisition"),
        backgroundColor: const Color(0xF2F3F6FF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.goToRequisitionTab,
          // onPressed: widget.goToRequisitionTab,
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔽 Segmented Toggle
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xF2F3F6FF),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Color(0xF2E1E1E1)),
                ),
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    _toggleItem(
                      label: "Manual",
                      selected: isManual,
                      onTap: () {
                        setState(() {
                          isManual = true;
                        });
                      },
                    ),
                    _toggleItem(
                      label: "Auto",
                      selected: !isManual,
                      onTap: () {
                        setState(() {
                          isManual = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 24),
        
              // Example content change based on toggle
                isManual ? _manualSection() : _autoSection(),
            ],
          ),

      ),
    );
  }
  Widget _manualSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Requisition Type",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _openRequisitionTypeSheet(context),
          child: InputDecorator(
            decoration: appInputDecoration("Requisition Type"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  requisitionType ?? "Select type",
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Vessel Name",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: appInputDecoration("Vessel Name"),
        ),
        const SizedBox(height: 10),
        const Text(
          "Port",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _openPortSheet(context),
          child: InputDecorator(
            decoration: appInputDecoration("Select port for delivery"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectPort ?? "Select type",
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "ETA to port",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            if (pickedDate != null) {
              setState(() {
                selectedDate = pickedDate;
              });
            }
          },
          child: InputDecorator(
            decoration: appInputDecoration("Date"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? "Select date"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Requisition Type",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        TextFormField(
          maxLines: 4,
          decoration: appInputDecoration("Enter description"),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: widget.onContinue, // 👈 THIS switches tab
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD97A1D),
            foregroundColor: Colors.white,            // 👈 text (and icon) color
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // 👈 border radius
            ),
            padding: const EdgeInsets.only(
              left: 175,
              top: 10,
              right: 175,
              bottom: 10,
            ),
          ),
          child: const Text(
            "Continue",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
  Widget _autoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Auto mode will generate items automatically.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
  Widget _requisitionOption(String value) {
    return ListTile(
      title: Text(value),
      trailing: requisitionType == value
          ? const Icon(Icons.check, color: Color(0xFFDE7311))
          : null,
      onTap: () {
        setState(() {
          requisitionType = value;
        });
        Navigator.pop(context);
      },
    );
  }
  Widget _portOption(String value) {
    return ListTile(
      title: Text(value),
      trailing: selectPort == value
          ? const Icon(Icons.check, color: Color(0xFFDE7311))
          : null,
      onTap: () {
        setState(() {
          selectPort = value;
        });
        Navigator.pop(context);
      },
    );
  }
  Widget _toggleItem({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3), // 👈 spacing
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFD97A1D) : Colors.transparent,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
