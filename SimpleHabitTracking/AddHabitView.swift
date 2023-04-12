//
//  AddHabitView.swift
//  SimpleHabitTracking
//
//  Created by Farhad Bagherzadeh on 15/2/2023.
//

import SwiftUI

struct AddHabitView: View {
  @State private var name: String = ""
  @State private var description: String = ""
  @EnvironmentObject var viewModel: HabitViewModel
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationView {
      Form {
        TextField("Name", text: $name)
        TextField("Description", text: $description)
      }
      .navigationTitle("Add activity")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Save", action: {
            viewModel.addHabit(Habit(name: name, description: description, numberOfCompletion: 0))
            dismiss()
          })
        }
      }
    }
  }
}

struct AddHabitView_Previews: PreviewProvider {
  static var previews: some View {
    AddHabitView()
  }
}
