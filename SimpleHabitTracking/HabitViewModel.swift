//
//  HabitViewModel.swift
//  SimpleHabitTracking
//
//  Created by Farhad Bagherzadeh on 8/2/2023.
//

import Foundation

class HabitViewModel: ObservableObject {
  private let key: String = "habits"
  @Published var habits: [Habit] = []

  init() {
    loadHabits()
  }

  func updateHabit(_ habit: Habit) {
    guard let index = habits.firstIndex(where: { $0.id == habit.id }) else { return }
    habits[index].numberOfCompletion = habit.numberOfCompletion
    saveHabits()
  }

  func delete(at indexSet: IndexSet) {
    habits.remove(atOffsets: indexSet)
    saveHabits()
  }

  func addHabit(_ habit: Habit) {
    habits.insert(habit, at: 0)
    saveHabits()
  }

  private func loadHabits() {
    guard let data = UserDefaults.standard.data(forKey: key) else { return }
    habits = (try? JSONDecoder().decode([Habit].self, from: data)) ?? []
  }

  private func saveHabits() {
    guard let data = try? JSONEncoder().encode(habits) else { return }
    UserDefaults.standard.set(data, forKey: key)
  }
}
