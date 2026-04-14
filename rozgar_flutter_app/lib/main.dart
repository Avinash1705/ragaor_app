import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/jobList/JonScreen.dart';

void main() {
  runApp(const ProviderScope(child: RozgarApp()));
}

class RozgarApp extends StatelessWidget {
  const RozgarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rozgar',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF08162E),
        colorScheme: const ColorScheme.dark(primary: Color(0xFF2D6BFF)),
      ),
      home: const JobScreen(),
    );
  }
}

enum AppPage { home, worker, employer, jobs, admin }

final pageProvider = StateProvider<AppPage>((ref) => AppPage.home);

class HomeShell extends ConsumerWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ROZGAR'),
        actions: [
          for (final p in AppPage.values)
            TextButton(
              onPressed: () => ref.read(pageProvider.notifier).state = p,
              child: Text(p.name.toUpperCase()),
            ),
          const SizedBox(width: 12),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: switch (page) {
          AppPage.home => const LandingPage(),
          AppPage.worker => const DashboardPage(title: 'Worker Dashboard'),
          AppPage.employer => const DashboardPage(title: 'Employer Dashboard'),
          AppPage.jobs => const JobsPage(),
          AppPage.admin => const DashboardPage(title: 'Admin Panel'),
        },
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Real Jobs.\nReal Wages.\nNo Middleman.', style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Text('Connecting workers directly to verified employers across India.'),
              ],
            ),
          ),
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(title: Text('Raj Mistri / Mason'), trailing: Text('₹12,000')),
                    Divider(),
                    ListTile(title: Text('Weaving Operator'), trailing: Text('₹9,500')),
                    Divider(),
                    ListTile(title: Text('Painter / Putty Work'), trailing: Text('₹11,000')),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

final jobsProvider = Provider<List<Map<String,String>>>((ref) => [
  {'title':'Raj Mistri / Mason','city':'Surat','salary':'₹12,000'},
  {'title':'Senior Mason - Site Supervisor','city':'Ahmedabad','salary':'₹14,000'},
  {'title':'Shuttering Carpenter','city':'Mumbai','salary':'₹10,500'},
]);

class JobsPage extends ConsumerWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobs = ref.watch(jobsProvider);
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: jobs.length,
      itemBuilder: (_, i) {
        final job = jobs[i];
        return Card(
          child: ListTile(
            title: Text(job['title']!),
            subtitle: Text(job['city']!),
            trailing: FilledButton(onPressed: () {}, child: Text(job['salary']!)),
          ),
        );
      },
    );
  }
}

class DashboardPage extends StatelessWidget {
  final String title;
  const DashboardPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      children: [
        statCard('Jobs Completed', '12'),
        statCard('Total Earned', '₹1.4L'),
        statCard('Trust Score', '4.8★'),
        statCard('Applications', '1'),
      ],
    );
  }

  Widget statCard(String title, String value) => Card(
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text(title), const SizedBox(height: 8), Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold))],
      ),
    ),
  );
}
