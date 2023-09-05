//
//  GroupedExpenses.swift
//  SwiftDataTutorial
//
//  Created by Rin on 2023/09/05.
//

import SwiftUI

struct GroupedExpenses: Identifiable {
    var id: UUID = .init()
    var date: Date
    var expenses: [Expense]
}
