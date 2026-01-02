import 'package:flutter/material.dart';

/// Profile Screen - Main user profile management screen
/// Accessible via Bottom Navigation Bar
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header Section
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.pink[100],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'john.doe@email.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '+91 98765-43210',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Profile Options
              _buildSectionTitle('Account'),
              const SizedBox(height: 12),
              _buildProfileOption(
                context,
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit Profile - Coming Soon')),
                  );
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.location_on_outlined,
                title: 'My Addresses',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('My Addresses - Coming Soon')),
                  );
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.payment_outlined,
                title: 'Payment Methods',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment Methods - Coming Soon')),
                  );
                },
              ),
              const SizedBox(height: 24),

              _buildSectionTitle('Settings'),
              const SizedBox(height: 12),
              _buildProfileOption(
                context,
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notifications - Coming Soon')),
                  );
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.lock_outline,
                title: 'Privacy & Security',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Privacy & Security - Coming Soon')),
                  );
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Help & Support - Coming Soon')),
                  );
                },
              ),
              const SizedBox(height: 24),

              _buildSectionTitle('About'),
              const SizedBox(height: 12),
              _buildProfileOption(
                context,
                icon: Icons.info_outline,
                title: 'About Us',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('About Us - Coming Soon')),
                  );
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.logout,
                title: 'Logout',
                titleColor: Colors.red,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logout - Coming Soon')),
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? titleColor,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.pink),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: titleColor ?? Colors.black,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
        onTap: onTap,
      ),
    );
  }
}

