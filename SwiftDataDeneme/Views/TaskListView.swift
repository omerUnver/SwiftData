//
//  TaskListView.swift
//  SwiftDataDeneme
//
//  Created by M.Ömer Ünver on 22.06.2023.
//

import SwiftUI
import SwiftData
struct TaskListView : View {
    @Environment(\.modelContext) private var context
    let toDoItems : [TestModel]
    private func deleteToDoItem (_ indexSet : IndexSet) {
        indexSet.forEach { index in
            let toDoItem = toDoItems[index]
            context.delete(toDoItem)
            try? context.save()
        }
    }
    
    
    static var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        return formatter
    }
    
    var body: some View {
        List{
            ForEach(toDoItems) { toDoItem in
                VStack{
                    HStack{
                        Text(toDoItem.title)
                        Spacer()
                        if toDoItem.isComleted {
                            Image(systemName: "swift")
                                .foregroundColor(.orange)
                                
                                
                            
                        }
                    }
                    Text("\(toDoItem.date, formatter: Self.dateFormatter)")
                    
                }
                .onTapGesture {
                    toDoItem.isComleted.toggle()
                    try? context.save()
                }
                
            }.onDelete(perform: deleteToDoItem)
        }
        
        
    }
}
