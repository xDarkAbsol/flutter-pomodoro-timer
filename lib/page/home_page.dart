import 'package:flutter/material.dart';
import 'package:pomodoro/controller.dart';
import 'package:pomodoro/theme/app_theme.dart';
import 'package:pomodoro/widgets/modes.dart';

Color _getButtonColor(PomodoroMode currentMode) {
  switch (currentMode) {
    case PomodoroMode.work:
      return AppColors.work;
    case PomodoroMode.longBreak:
      return AppColors.longBreak;
    case PomodoroMode.shortBreak:
      return AppColors.shortBreak;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.controller});

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: switch (controller.currentMode) {
        PomodoroMode.work => AppColors.workBg,
        PomodoroMode.longBreak => AppColors.longBreakBg,
        PomodoroMode.shortBreak => AppColors.shortBreakBg,
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //* Title
                AppSpacing.gapLg,
                Text(
                  'Pomodoro'.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Spacer(),
                //* Modes
                Modes(controller: controller),
                const Spacer(flex: 2),
                //* Timer
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 260,
                      width: 260,
                      child: CircularProgressIndicator(
                        value: controller.progress,
                        strokeWidth: 12,
                        color: _getButtonColor(controller.currentMode),
                        backgroundColor: AppColors.border,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.85,
                              end: 1,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        controller.formattedTime,
                        key: ValueKey<PomodoroMode>(controller.currentMode),
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(fontSize: 64),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                //* Controls
                GestureDetector(
                  onTap: controller.toggleTimer,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(
                      vertical: AppSpacing.sm,
                      horizontal: controller.isRunning
                          ? AppSpacing.xl * 1.8
                          : AppSpacing.xl * 1.5,
                    ),
                    decoration: BoxDecoration(
                      color: _getButtonColor(controller.currentMode),
                      borderRadius: AppSpacing.radiusPill,
                      boxShadow: [
                        BoxShadow(
                          color: _getButtonColor(
                            controller.currentMode,
                          ).withValues(alpha: 0.3),
                          offset: Offset(0, 6),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    child: AnimatedSwitcher(
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        key: ValueKey<bool>(controller.isRunning),
                        controller.isRunning ? 'PAUSE' : 'START',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1.6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
