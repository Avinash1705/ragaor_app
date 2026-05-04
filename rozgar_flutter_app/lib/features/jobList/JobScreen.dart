import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controller/JobListController.dart';

class JobScreen extends ConsumerWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobsAsync = ref.watch(jobProvider);
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FF),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _categories(),
            Expanded(
              child: jobsAsync.when(
                data: (jobs) => ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 8)
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(job.name,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(job.intensive),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(job.profession,
                              style: const TextStyle(color: Colors.black54)),
                          const SizedBox(height: 10),
                          Row(children: [
                            const Icon(Icons.location_on, size: 18, color: Colors.red),
                            const SizedBox(width: 4),
                            Text(job.location),
                          ]),
                          const SizedBox(height: 8),
                          Row(children: [
                            const Icon(Icons.calendar_month, size: 18),
                            const SizedBox(width: 4),
                            Text('${job.days} days'),
                          ]),
                          const SizedBox(height: 12),
                          Text('₹${job.income}/month',
                              style: const TextStyle(
                                  fontSize: 28,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  },
                ),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: Color(0xff2348F5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text('Namaste 🙏', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          const Text('Navin Kumar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: 'Search jobs by city or type...',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories() {
    final items = ['All Jobs', 'Near Me', 'Construction', 'Textile'];
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final active = index == 1;
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: active ? const Color(0xff2348F5) : Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: Text(items[index], style: TextStyle(color: active ? Colors.white : Colors.black87)),
            ),
          );
        },
      ),
    );
  }
}
