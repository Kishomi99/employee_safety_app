import 'package:application/core/app_export.dart';
import 'controller/manager_home_controller.dart';

class ManagerHomeScreen extends GetWidget<ManagerHomeController> {
  const ManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Project & Report
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 223, 212, 228),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Search bar
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: AppColors.secondary, size: 30),
                      const SizedBox(width: 10),
                      Text(
                        'search'.tr,
                        style: AppStyle.lableText.copyWith(
                          color: AppColors.secondary,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              // Tabs
              TabBar(
                indicatorColor: AppColors.primary,
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    child: Text(
                      'project_tab'.tr,
                      style: AppStyle.inputText.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'report_tab'.tr,
                      style: AppStyle.inputText.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              // Tab Views
              Expanded(
                child: TabBarView(
                  children: [
                    // Project Tab Content
                    ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: 5, // Change based on data
                      itemBuilder: (context, index) {
                        return projectCard();
                      },
                    ),
                    // Report Tab Content
                    Center(
                      child: Text(
                        'Report Content Here',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectCard() {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JK Construction',
                  style: AppStyle.inputText.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 20),
                    SizedBox(width: 6),
                    Text('123 Site Street, Colombo'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(Icons.report, size: 20, color: Colors.red),
                    SizedBox(width: 6),
                    Text('15 Incident Reports'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Icon(Icons.people, size: 20, color: Colors.green),
                    SizedBox(width: 6),
                    Text('344 Employees'),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'JK Construction',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 6),
                  Text('123 Site Street, Colombo'),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: const [
                  Icon(Icons.home_work, size: 18),
                  SizedBox(width: 6),
                  Text('Site No: 005'),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('15 ${'incident_reported'.tr}'),
                      Text('05 ${'audit_report'.tr}'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '344',
                        style: AppStyle.homeCardNumber,
                      ),
                      Text(
                        'employee_count'.tr,
                        style: AppStyle.inputText.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
