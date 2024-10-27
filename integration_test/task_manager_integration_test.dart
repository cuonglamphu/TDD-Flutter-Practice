// integration_test/task_manager_integration_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Task Manager integration test: Add, complete, and delete tasks',
      (WidgetTester tester) async {
    await tester.pumpWidget(TaskManagerApp());
    print('🚀 Starting integration test for Task Manager');

    // Step 1: Open the add task dialog and add a task
    await tester.tap(find.byTooltip('Add Task'));
    await tester.pumpAndSettle();
    print('✅ Step 1: Opened add task dialog');

    await tester.enterText(find.byType(TextField), 'Test Task 1');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    print('✅ Step 2: Task "Test Task 1" added');

    // Step 2: Add another task
    await tester.tap(find.byTooltip('Add Task'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Test Task 2');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    print('✅ Step 3: Task "Test Task 2" added');

    // Step 3: Verify both tasks are in the list
    expect(find.text('Test Task 1'), findsOneWidget);
    expect(find.text('Test Task 2'), findsOneWidget);
    print('✅ Step 4: Both tasks are visible in the list');

    // Step 4: Mark the first task as completed
    await tester.tap(find.text('Test Task 1'));
    await tester.pumpAndSettle();
    print('✅ Step 5: First task marked as completed');

    // Step 5: Verify that the first task is shown with a strikethrough
    final completedTask = find.text('Test Task 1');
    final Text completedTaskWidget = tester.widget(completedTask);
    expect(
      completedTaskWidget.style?.decoration,
      TextDecoration.lineThrough,
    );
    print('✅ Step 6: Verified first task is completed with strikethrough');

    // Step 6: Delete completed tasks
    await tester.tap(find.byTooltip('Delete Completed Tasks'));
    await tester.pumpAndSettle();
    print('✅ Step 7: Completed tasks deleted');

    // Step 7: Verify that the first task is removed and the second task remains
    expect(find.text('Test Task 1'), findsNothing);
    expect(find.text('Test Task 2'), findsOneWidget);
    print('✅ Step 8: First task removed, second task still in list');

    // Step 8: Mark the second task as completed and delete it
    await tester.tap(find.text('Test Task 2'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Delete Completed Tasks'));
    await tester.pumpAndSettle();
    print('✅ Step 9: Second task marked as completed and deleted');

    // Step 9: Verify the task list is now empty
    expect(find.text('Test Task 2'), findsNothing);
    print(
        '🎉 Test completed successfully: All tasks added, marked, and deleted as expected');
  });
}
