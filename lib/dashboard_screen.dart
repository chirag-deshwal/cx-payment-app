import 'package:flutter/material.dart';
import 'package:cx_payment_app/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cx_payment_app/history_screen.dart';
import 'package:cx_payment_app/analytics_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardContent(), // Home
    const Center(child: Text("Search Screen")), // Placeholder
    const Center(child: Text("Swap Screen")), // Placeholder for center button
    const HistoryScreen(), // Wallets/History
    const AnalyticsScreen(), // Settings/Analytics as placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Allow body to go behind the bottom nav
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.kBackgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: _screens[_currentIndex == 2
              ? 0
              : _currentIndex], // Handle Swap visually or logical?
          // For now, let's keep simple index mapping.
          // Note: The image has 5 items. 0:Home, 1:Search, 2:Swap(Center), 3:Wallets, 4:Settings
        ),
      ),
      bottomNavigationBar: _buildCustomBottomNavBar(),
    );
  }

  Widget _buildCustomBottomNavBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E22).withOpacity(0.9),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_outlined, 0),
          _buildNavItem(Icons.search, 1),
          _buildCenterSwapButton(),
          _buildNavItem(Icons.account_balance_wallet_outlined, 3), // Wallets
          _buildNavItem(Icons.settings_outlined, 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Icon(
          icon,
          color: isSelected ? AppTheme.kWhite : Colors.grey,
          size: 26,
        ),
      ),
    );
  }

  Widget _buildCenterSwapButton() {
    return GestureDetector(
      onTap: () {
        // Handle swap action
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppTheme.kLimeGreen,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppTheme.kLimeGreen.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.swap_horiz, color: Colors.black, size: 28),
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBar(),
          const SizedBox(height: 30),
          _buildBalanceSection(),
          const SizedBox(height: 30),
          _buildWalletCards(),
          const SizedBox(height: 100), // Space for bottom nav
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=33'),
        ),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: AppTheme.kSurfaceColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.menu, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildBalanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wallets Balance',
              style: GoogleFonts.manrope(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.kLimeGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'View details',
                style: GoogleFonts.manrope(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          '\$48,532.00',
          style: GoogleFonts.manrope(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }

  Widget _buildWalletCards() {
    return Column(
      children: [
        _buildWalletCard(
          title: 'Crypto',
          balance: '\$8,987.00',
          assetsCount: '24 assets',
          percentage: '12%',
          isPositive: true,
          backgroundColor: AppTheme.kLimeGreen, // Lime
          textColor: Colors.black,
        ),
        const SizedBox(height: 15),
        _buildWalletCard(
          title: 'Futures',
          balance: '\$12,456.00',
          assetsCount: '8 assets',
          percentage: '43%',
          isPositive: false,
          backgroundColor: AppTheme.kDeepPurple, // Purple
          textColor: Colors.white,
        ),
        const SizedBox(height: 15),
        _buildWalletCard(
          title: 'NFT',
          balance: '\$3,842.00',
          assetsCount: '14 assets',
          percentage: '5%',
          isPositive: true,
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
      ],
    );
  }

  Widget _buildWalletCard({
    required String title,
    required String balance,
    required String assetsCount,
    required String percentage,
    required bool isPositive,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                balance,
                style: GoogleFonts.manrope(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                assetsCount,
                style: GoogleFonts.manrope(
                  color: textColor.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  Icon(
                    isPositive ? Icons.arrow_outward : Icons.arrow_outward,
                    // Note: Flip icon for negative if needed, usually simple arrow up right is common for "trend"
                    // But typically negative is down right.
                    color: textColor,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    percentage,
                    style: GoogleFonts.manrope(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Decorative "notch" or "tab" visual at the top could be added with a Stack if exact match needed
        ],
      ),
    );
  }
}
