import 'package:flutter/material.dart';
import 'package:demo_crm/l10n/app_localizations.dart';

class AboutCrmPage extends StatelessWidget {
  const AboutCrmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.translate('about_crm'),
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _SectionContainer(
              title: locale == 'es'
                  ? '¿Qué es un CRM empresarial?'
                  : 'What is an Enterprise CRM?',
              children: [
                _BulletPoint(
                  locale == 'es'
                      ? 'Un CRM (Customer Relationship Management) es un software diseñado para administrar, analizar y optimizar todas las interacciones de tu empresa con clientes reales y potenciales.'
                      : 'A CRM (Customer Relationship Management) is a software designed to manage, analyze and optimize all interactions of your company with real and potential clients.',
                ),
                _BulletPoint(
                  locale == 'es'
                      ? 'Sirve para centralizar la información, dar seguimiento a cotizaciones o leads, y entender de primera mano en qué estado se encuentra cada oportunidad negocio.'
                      : 'It is used to centralize information, track quotes or leads, and understand firsthand the status of each business opportunity.',
                ),
                _BulletPoint(
                  locale == 'es'
                      ? 'Ayuda a organizar clientes porque permite clasificar cada contacto, asociar notas compartidas con el equipo, e integrar comunicaciones y recordatorios.'
                      : 'It helps organize clients by allowing to classify each contact, associate shared notes with the team, and integrate communications and reminders.',
                ),
                _BulletPoint(
                  locale == 'es'
                      ? 'Mejora las ventas ofreciendo una visión profunda del pipeline, facilitando los pronósticos (forecasting) y reduciendo las pérdidas por descuidos o falta de seguimiento.'
                      : 'It improves sales by offering deep pipeline insights, facilitating forecasting, and reducing losses due to neglect or lack of follow-up.',
                ),
                _BulletPoint(
                  locale == 'es'
                      ? 'Se integra fácilmente con sistemas existentes como ERP, marketing automation y plataformas de correo, convirtiéndose en el corazón de los datos del cliente.'
                      : 'It integrates easily with existing systems like ERP, marketing automation, and email platforms, becoming the heart of customer data.',
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              loc.translate('benefits'),
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _BenefitsGrid(locale: locale),
          ],
        ),
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionContainer({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Icon(Icons.check_circle, size: 16, color: Colors.green),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitsGrid extends StatelessWidget {
  final String locale;

  const _BenefitsGrid({required this.locale});

  @override
  Widget build(BuildContext context) {
    final benefits = locale == 'es'
        ? [
            {
              'icon': Icons.folder_shared,
              'title': 'Mejor organización',
              'desc': 'Toda la info de clientes en un solo lugar.',
            },
            {
              'icon': Icons.bar_chart,
              'title': 'Seguimiento de ventas',
              'desc': 'Visualiza tu embudo de ventas.',
            },
            {
              'icon': Icons.autorenew,
              'title': 'Automatización',
              'desc': 'Reduce esfuerzo en tareas repetitivas.',
            },
            {
              'icon': Icons.trending_up,
              'title': 'Aumento de conversiones',
              'desc': 'Cierra más tratos con mejor seguimiento.',
            },
            {
              'icon': Icons.hub,
              'title': 'Centralización',
              'desc': 'Sincroniza todas las capas de tu empresa.',
            },
          ]
        : [
            {
              'icon': Icons.folder_shared,
              'title': 'Better Organization',
              'desc': 'All client info in one place.',
            },
            {
              'icon': Icons.bar_chart,
              'title': 'Sales tracking',
              'desc': 'Visualize your sales funnel.',
            },
            {
              'icon': Icons.autorenew,
              'title': 'Automation',
              'desc': 'Reduce effort in repetitive tasks.',
            },
            {
              'icon': Icons.trending_up,
              'title': 'Higher conversions',
              'desc': 'Close more deals with better tracking.',
            },
            {
              'icon': Icons.hub,
              'title': 'Centralization',
              'desc': 'Sync all layers of your enterprise.',
            },
          ];

    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 3 : 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isDesktop ? 1.5 : 2.5,
      ),
      itemCount: benefits.length,
      itemBuilder: (context, index) {
        final b = benefits[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  b['icon'] as IconData,
                  size: 36,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 12),
                Text(
                  b['title'] as String,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  b['desc'] as String,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
