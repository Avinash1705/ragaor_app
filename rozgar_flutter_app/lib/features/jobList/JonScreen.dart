import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/JobListController.dart';

class JobScreen extends ConsumerWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobsAsync = ref.watch(jobProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Jobs"),
        centerTitle: true,
      ),
      body: jobsAsync.when(
        data: (jobs) {
          if (jobs.isEmpty) {
            return const Center(
              child: Text("No Jobs Found"),
            );
          }

          return ListView.builder(
            itemCount: jobs.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final job = jobs[index];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      /// Job Name
                      Text(
                        job.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// Profession
                      Row(
                        children: [
                          const Icon(Icons.work_outline,
                              size: 18),
                          const SizedBox(width: 6),
                          Text(job.profession),
                        ],
                      ),

                      const SizedBox(height: 8),

                      /// Location
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 18),
                          const SizedBox(width: 6),
                          Text(job.location),
                        ],
                      ),

                      const SizedBox(height: 8),

                      /// Income
                      Row(
                        children: [
                          const Icon(Icons.currency_rupee,
                              size: 18),
                          const SizedBox(width: 6),
                          Text(
                            "${job.income}/month",
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      /// Working Days
                      Row(
                        children: [
                          const Icon(Icons.calendar_month,
                              size: 18),
                          const SizedBox(width: 6),
                          Text(
                            "${job.days} days/week",
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      /// Experience
                      Row(
                        children: [
                          const Icon(Icons.star_border,
                              size: 18),
                          const SizedBox(width: 6),
                          Text(
                            "${job.experience} years exp",
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      /// Work Needed
                      Text(
                        "Work: ${job.workNeeded}",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// Company / Intensive
                      Align(
                        alignment:
                        Alignment.centerRight,
                        child: Chip(
                          label: Text(job.intensive),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        error: (e, _) => Center(
          child: Text("Error: $e"),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}