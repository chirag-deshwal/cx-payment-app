import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cx_payment_app/theme/app_theme.dart';
import 'package:cx_payment_app/widgets/glass_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cx_payment_app/history_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardContent(),
    const HistoryScreen(),
    const Center(child: Text("Analytics")),
    const Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    // If you want state preservation, use IndexedStack or PageView.
    // For now, consistent with original intent, we just switch the body.
    return Scaffold(
      backgroundColor: AppTheme.kBackgroundColor,
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: AppTheme.kSurfaceColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => setState(() => _currentIndex = 0),
            icon: Icon(Icons.home_filled,
                color:
                    _currentIndex == 0 ? AppTheme.kPrimaryColor : Colors.grey),
          ),
          IconButton(
            onPressed: () => setState(() => _currentIndex = 1),
            icon: Icon(Icons.history,
                color:
                    _currentIndex == 1 ? AppTheme.kPrimaryColor : Colors.grey),
          ),
          IconButton(
            onPressed: () => setState(() => _currentIndex = 2),
            icon: Icon(Icons.pie_chart_outline,
                color:
                    _currentIndex == 2 ? AppTheme.kPrimaryColor : Colors.grey),
          ),
          IconButton(
            onPressed: () => setState(() => _currentIndex = 3),
            icon: Icon(Icons.settings_outlined,
                color:
                    _currentIndex == 3 ? AppTheme.kPrimaryColor : Colors.grey),
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBar(context),
          const SizedBox(height: 20),
          _buildBalanceCard(context),
          const SizedBox(height: 20),
          _buildActionButtons(context),
          const SizedBox(height: 20),
          _buildChartSection(context),
          const SizedBox(height: 20),
          _buildRecentTransactions(context),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=11'), // Dummy image
              backgroundColor: AppTheme.kSurfaceColor,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                Text(
                  'Crypto User',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.kSurfaceColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.notifications_outlined, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return GlassCard(
      opacity: 0.05,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Balance',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppTheme.kSecondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_upward,
                          color: AppTheme.kSecondaryColor, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        '+4.25%',
                        style: TextStyle(
                            color: AppTheme.kSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '\$43,762.64',
              style: GoogleFonts.orbitron(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '1.2345 BTC',
              style: TextStyle(color: Colors.grey[400], fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    // Note: If you want to handle navigation here, you might need Navigator.
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(Icons.arrow_upward, 'Send'),
        _buildActionButton(Icons.arrow_downward, 'Receive'),
        _buildActionButton(Icons.shopping_cart_outlined, 'Buy'),
        _buildActionButton(Icons.swap_horiz, 'Swap'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppTheme.kPrimaryColor.withOpacity(0.8),
                AppTheme.kPrimaryColor.withOpacity(0.4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.kPrimaryColor.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildChartSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Market Trend',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 3),
                    FlSpot(1, 4),
                    FlSpot(2, 3.5),
                    FlSpot(3, 5),
                    FlSpot(4, 4),
                    FlSpot(5, 6),
                    FlSpot(6, 6.5),
                  ],
                  isCurved: true,
                  color: AppTheme.kSecondaryColor,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.kSecondaryColor.withOpacity(0.3),
                        AppTheme.kBackgroundColor.withOpacity(0.0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 15),
        _buildTransactionItem('Spotify Premium', 'Subscription', '-\$12.99',
            Colors.white, Icons.music_note),
        _buildTransactionItem('Bitcoin Buy', 'Investment', '+\$500.00',
            AppTheme.kSecondaryColor, Icons.trending_up),
        _buildTransactionItem('Transfer to John', 'Sending', '-\$150.00',
            Colors.white, Icons.person),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String subtitle, String amount,
      Color amountColor, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.kSurfaceColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
                color: amountColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
