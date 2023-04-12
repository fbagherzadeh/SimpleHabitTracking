//
//  EditHabitView.swift
//  SimpleHabitTracking
//
//  Created by Farhad Bagherzadeh on 8/2/2023.
//

import Combine
import SwiftUI

struct EditHabitView: View {
  @State private var habit: Habit
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var viewModel: HabitViewModel

  init(_ habit: Habit) {
    _habit = State(wrappedValue: habit)
  }

  var body: some View {
    Form {
      Text(habit.name)
      Text(habit.description)
      Stepper(value: $habit.numberOfCompletion, in: 0...1_000_000) {
        VStack(alignment: .leading) {
          Text("Number Of Completion")
          Text("＃\(habit.numberOfCompletion)")
        }
      }
    }
    .navigationTitle("Edit habit")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button("Update") {
          viewModel.updateHabit(habit)
          dismiss()
        }
      }
    }
  }
}

struct EditHabitView_Previews: PreviewProvider {
  static var previews: some View {
    EditHabitView(.init(name: "na", description: "des", numberOfCompletion: 1))
  }
}
