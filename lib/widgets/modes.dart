import 'package:flutter/material.dart';
import 'package:pomodoro/controller.dart';
import 'package:pomodoro/theme/app_theme.dart';

class Modes extends StatelessWidget {
  const Modes({super.key, required this.controller});
  final Controller controller;

  @override
  Widget build(BuildContext context) {
    PomodoroMode selectedMode = controller.currentMode;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: AppSpacing.radiusPill,
        color: Theme.of(context).colorScheme.surfaceContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: Offset(0, 6),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          WorkButton(controller: controller, selectedMode: selectedMode),
          ShortBreakButton(controller: controller, selectedMode: selectedMode),
          LongBreakButton(controller: controller, selectedMode: selectedMode),
        ],
      ),
    );
  }
}

class WorkButton extends StatelessWidget {
  const WorkButton({
    super.key,
    required this.controller,
    required this.selectedMode,
  });
  final PomodoroMode selectedMode;
  final Controller controller;

  @override
  Widget build(BuildContext context) {
    const PomodoroMode buttonMode = PomodoroMode.work;
    return GestureDetector(
      onTap: () => controller.setMode(buttonMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        margin: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: AppSpacing.sm,
        ),
        padding: selectedMode == buttonMode
            ? const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm + 4,
                vertical: AppSpacing.sm,
              )
            : const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: selectedMode == PomodoroMode.work
              ? AppColors.workSoft
              : Colors.transparent,
          borderRadius: AppSpacing.radiusPill,
        ),
        child: Text(
          'Work'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: buttonMode == selectedMode
                ? AppColors.work
                : Theme.of(context).colorScheme.outline,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class ShortBreakButton extends StatelessWidget {
  const ShortBreakButton({
    super.key,
    required this.controller,
    required this.selectedMode,
  });
  final PomodoroMode selectedMode;
  final Controller controller;

  @override
  Widget build(BuildContext context) {
    const PomodoroMode buttonMode = PomodoroMode.shortBreak;
    return GestureDetector(
      onTap: () => controller.setMode(buttonMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        margin: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: AppSpacing.sm,
        ),
        padding: selectedMode == buttonMode
            ? const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm + 4,
                vertical: AppSpacing.sm,
              )
            : const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: selectedMode == PomodoroMode.shortBreak
              ? AppColors.shortBreakSoft
              : Colors.transparent,
          borderRadius: AppSpacing.radiusPill,
        ),
        child: Text(
          'Short Break'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: buttonMode == selectedMode
                ? AppColors.shortBreak
                : Theme.of(context).colorScheme.outline,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class LongBreakButton extends StatelessWidget {
  const LongBreakButton({
    super.key,
    required this.controller,
    required this.selectedMode,
  });
  final PomodoroMode selectedMode;
  final Controller controller;

  @override
  Widget build(BuildContext context) {
    const PomodoroMode buttonMode = PomodoroMode.longBreak;
    return GestureDetector(
      onTap: () => controller.setMode(buttonMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        margin: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: AppSpacing.sm,
        ),
        padding: selectedMode == buttonMode
            ? const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm + 4,
                vertical: AppSpacing.sm,
              )
            : const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: selectedMode == PomodoroMode.longBreak
              ? AppColors.longBreakSoft
              : Colors.transparent,
          borderRadius: AppSpacing.radiusPill,
        ),
        child: Text(
          'Long Break'.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: buttonMode == selectedMode
                ? AppColors.longBreak
                : Theme.of(context).colorScheme.outline,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
