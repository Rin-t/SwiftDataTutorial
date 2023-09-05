//
//  Expense.swift
//  SwiftDataTutorial
//
//  Created by Rin on 2023/09/05.
//

import Foundation
import SwiftData

@Model
final class Expense {

    var title: String
    var subTitle: String
    var amount: Double
    var date: Date

    var category: Category?

    init(title: String, subTitle: String, amount: Double, date: Date, category: Category?) {
        self.title = title
        self.subTitle = subTitle
        self.amount = amount
        self.date = date
        self.category = category
    }
}
