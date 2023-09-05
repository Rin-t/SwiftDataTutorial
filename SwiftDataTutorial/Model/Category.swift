//
//  Category.swift
//  SwiftDataTutorial
//
//  Created by Rin on 2023/09/05.
//

import Foundation
import SwiftData


@Model
class Category {
    var categoryName: String

    @Relationship(deleteRule: .cascade, inverse: \Expense.category)
    var expenses: [Expense]?

    init(categoryName: String) {
        self.categoryName = categoryName
    }
}
