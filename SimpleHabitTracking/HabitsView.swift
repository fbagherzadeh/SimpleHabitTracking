//
//  ContentView.swift
//  SimpleHabitTracking
//
//  Created by Farhad Bagherzadeh on 8/2/2023.
//

import SwiftUI

struct HabitsView: View {
  @StateObject var viewModel: HabitViewModel = .init()
  @State var showSheet: Bool = false

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.habits) { habit in
          NavigationLink(
            destination: EditHabitView(habit)
              .environmentObject(viewModel)
          ) {
            rowView(habit)
          }
        }
        .onDelete(perform: viewModel.delete)
      }
      .navigationTitle("Habits")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) { EditButton() }
        ToolbarItem(placement: .navigationBarTrailing) { Button("Add", action: { showSheet = true }) }
      }
    }
    .sheet(isPresented: $showSheet) {
      AddHabitView()
        .environmentObject(viewModel)
    }
  }
}

private extension HabitsView {
  @ViewBuilder func rowView(_ habit: Habit) -> some View {
    HStack {
      VStack(alignment: .leading, spacing: 5) {
        Text(habit.name)
          .font(.body)
        Text(habit.description)
          .font(.caption)
      }

      Spacer()

      Text("\(habit.numberOfCompletion)＃")
    }
  }
}

struct HabitsView_Previews: PreviewProvider {
  static var previews: some View {
    HabitsView()
  }
}
