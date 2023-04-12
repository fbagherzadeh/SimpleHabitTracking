//
//  HabitModel.swift
//  SimpleHabitTracking
//
//  Created by Farhad Bagherzadeh on 8/2/2023.
//

import Foundation

struct Habit: Identifiable, Codable {
  let id: String
  let name: String
  let description: String
  var numberOfCompletion: Int

  init(id: String = UUID().uuidString, name: String, description: String, numberOfCompletion: Int) {
    self.id = id
    self.name = name
    self.description = description
    self.numberOfCompletion = numberOfCompletion
  }
}
