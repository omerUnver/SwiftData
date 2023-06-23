//
//  ContentView.swift
//  SwiftDataDeneme
//
//  Created by M.Ömer Ünver on 22.06.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) var colorScheme
    @Query(sort: \TestModel.date, order: .reverse, animation: .spring) private var allToDoItem : [TestModel]
    @State private var title : String = ""
    @State private var isComleted : Bool = false
    @State private var date : Date = Date.now
    var body: some View {
        VStack {
            Form{
                Section {
                    TextField("Title", text: $title)
                    DatePicker("Tarih", selection: $date, displayedComponents: .date)
                    Button("Save") {
                        let toDoItem = TestModel(title: title, isComleted: isComleted, date: date)
                        context.insert(toDoItem)
                        do {
                            try context.save()
                        }catch {
                            print(error.localizedDescription)
                        }
                        
                    }
                } header: {
                    Text("Save Task")
                }
                
                
                
            }
            .scrollDisabled(true)
            .frame(height: 175)
            .padding(.top, 2.5)
            .formStyle(.grouped)
            
        TaskListView(toDoItems: allToDoItem)
        
        }
        .background(colorScheme == .dark ? Color(red: 0, green: 0, blue: 0) : Color(red: 0.95, green: 0.95, blue: 0.97))
           
        
    }
        
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
