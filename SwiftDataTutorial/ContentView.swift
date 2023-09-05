//
//  ContentView.swift
//  SwiftDataTutorial
//
//  Created by Rin on 2023/09/03.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) var context

    @State private var showCreate = false
    @State private var toDoToEdit: ToDoItem?

    @Query(filter: #Predicate<ToDoItem> { $0.isCompleted == true }) private var items: [ToDoItem]

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack {
                        VStack {
                            if item.isCritical {
                                Image(systemName: "exclamationmark.3")
                                    .symbolVariant(.fill)
                                    .foregroundStyle(.red)
                                    .font(.largeTitle)
                                    .bold()
                            }

                            Text(item.title)
                                .font(.largeTitle)
                                .bold()

                            Text("\(item.timeStamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                .font(.callout)
                        }

                        Spacer()

                        Button {
                            withAnimation {
                                item.isCompleted.toggle()
                            }
                        } label: {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                context.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant(.fill)
                        }

                        Button {
                            toDoToEdit = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                                .tint(.orange)
                        }
                    }
                }
            }
            .navigationTitle("My To Do List")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showCreate.toggle()
                    }, label: {
                        Label("Add item", systemImage: "plus")
                    })
                }
            }
            .sheet(isPresented: $showCreate,
                   content: {
                NavigationStack {
                    CreateTodoView()
                }
                .presentationDetents([.medium])
            })
            .sheet(item: $toDoToEdit) {
                toDoToEdit = nil
            } content: { item in
                UpdateToDoView(item: item)
            }
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: ToDoItem.self)
//}
