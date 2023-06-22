//
//  SwiftDataModel.swift
//  SwiftDataDeneme
//
//  Created by M.Ömer Ünver on 22.06.2023.
//

import Foundation
import SwiftData
@Model
class TestModel{
    var title : String
    var isComleted : Bool
    var date : Date
    init(title: String, isComleted: Bool, date: Date) {
        self.title = title
        self.isComleted = isComleted
        self.date = date
    }
}
