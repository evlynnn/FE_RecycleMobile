import 'package:flutter/material.dart';
import 'package:recycle_mobile/util/colors.dart';
import 'package:recycle_mobile/screens/rulesScreen.dart';

class HomapageScreen extends StatefulWidget{
  const HomapageScreen({super.key});

  @override
  State<HomapageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomapageScreen>{
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    // Dummy balance data
    const currentBalance = 1000;
    const minimumBalance = 5000;
    const currency = 'Rp';

    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 20 : screenWidth * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Balance',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 20 : 24,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 10 : 15),
                    Text(
                      '$currency${currentBalance.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 32 : 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isSmallScreen ? 10 : 20),
              Container(
                padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange[800]),
                    SizedBox(width: isSmallScreen ? 8 : 12),
                    Expanded(
                      child: Text(
                        'Minimum balance $currency${minimumBalance.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          color: Colors.orange[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 20 : screenWidth * 0.08,
          vertical: isSmallScreen ? 10 : 20,
        ),
        child: SizedBox(
          height: isSmallScreen ? 48 : 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RulesScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightGreen,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.darkPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}