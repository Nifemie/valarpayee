import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OurServicesWidget extends StatelessWidget {
  const OurServicesWidget({Key? key}) : super(key: key);

  final List<ServiceItem> services = const [
    ServiceItem(icon: 'assets/images/service_icon/airtime.svg', label: 'Airtime'),
    ServiceItem(icon: 'assets/images/service_icon/Data.svg', label: 'Data'),
    ServiceItem(icon: 'assets/images/service_icon/betting.svg', label: 'Betting'),
    ServiceItem(icon: 'assets/images/service_icon/light.svg', label: 'Electricity'),
    ServiceItem(icon: 'assets/images/service_icon/cable.svg', label: 'Cable Tv'),
    ServiceItem(icon: 'assets/images/service_icon/arrow-swap-horizontal.svg', label: 'Swap Currency'),
    ServiceItem(icon: 'assets/images/service_icon/internet.svg', label: 'Internet'),
    ServiceItem(icon: 'assets/images/service_icon/gift.svg', label: 'Giftcard'),
    ServiceItem(icon: 'assets/images/service_icon/int.svg', label: 'Intl. Airtime'),
    ServiceItem(icon: 'assets/images/service_icon/Education.svg', label: 'Education'),
    ServiceItem(icon: 'assets/images/service_icon/shoping.svg', label: 'Shopping'),
    ServiceItem(icon: 'assets/images/service_icon/Insurance.svg', label: 'Insurance'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            'Our Services',
            style: TextStyle(
              color: Color(0xFFF9FAFB),
              fontFamily: 'SF Pro',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 22 / 18, // line-height / font-size
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
          decoration: BoxDecoration(
            color: const Color(0xFF2B2725),
            borderRadius: BorderRadius.circular(16),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return _buildServiceItem(services[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildServiceItem(ServiceItem service) {
    return GestureDetector(
      onTap: () {
        // Handle service tap
        print('Tapped on ${service.label}');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF46352B),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: SvgPicture.asset(
                service.icon,
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFF76301), // Orange color for icons
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service.label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFFF9FAFB),
              fontFamily: 'SF Pro',
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 14 / 10, // line-height / font-size
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String icon;
  final String label;

  const ServiceItem({
    required this.icon,
    required this.label,
  });
}

// Usage example:
// In your screen:
// Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: const OurServicesWidget(),
// )