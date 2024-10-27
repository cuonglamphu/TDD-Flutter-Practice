import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/task_screen.dart';

void main() {
  testWidgets('Add, complete, and delete tasks', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TaskScreen()));
    print('🚀 Starting test: Add, complete, and delete tasks');

    // Open the add task dialog
    await tester.tap(find.byTooltip('Add Task'));
    await tester.pumpAndSettle();
    print('✅ Step 1: Opened add task dialog');

    // Enter the first task name and confirm
    await tester.enterText(find.byType(TextField), 'Test Task 1');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    print('✅ Step 2: First task added - "Test Task 1"');

    // Enter the second task name and confirm
    await tester.tap(find.byTooltip('Add Task'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Test Task 2');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    print('✅ Step 3: Second task added - "Test Task 2"');

    // Check if both tasks are displayed in the list
    expect(find.text('Test Task 1'), findsOneWidget);
    expect(find.text('Test Task 2'), findsOneWidget);
    print('✅ Step 4: Both tasks are displayed in the list');

    // Mark the first task as completed
    await tester.tap(find.text('Test Task 1'));
    await tester.pumpAndSettle();
    print('✅ Step 5: First task marked as completed');

    // Verify that the first task is shown with a strikethrough style
    final completedTask = find.text('Test Task 1');
    final Text completedTaskWidget = tester.widget(completedTask);
    expect(
      completedTaskWidget.style?.decoration,
      TextDecoration.lineThrough,
    );
    print('✅ Step 6: Verified first task is completed with strikethrough');

    // Delete the completed task
    await tester.tap(find.byTooltip('Delete Completed Tasks'));
    await tester.pumpAndSettle();
    print('✅ Step 7: Deleted completed tasks');

    // Check that the first task is removed and the second task remains
    expect(find.text('Test Task 1'), findsNothing);
    expect(find.text('Test Task 2'), findsOneWidget);
    print('✅ Step 8: First task removed; second task still in the list');

    // Mark the remaining task as completed and delete it
    await tester.tap(find.text('Test Task 2'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Delete Completed Tasks'));
    await tester.pumpAndSettle();
    print('✅ Step 9: Second task marked as completed and deleted');

    // Verify that the task list is now empty
    expect(find.text('Test Task 2'), findsNothing);
    print('✅ Step 10: All tasks deleted, task list is empty');

    print('🎉 Test completed: All steps passed successfully');
  });
}
