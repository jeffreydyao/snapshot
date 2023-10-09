//
//  ContentView.swift
//  Behaviors
//
//  Created by Jeffrey Yao on 2/10/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    

    
    let currentDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }()
    
    func test() {
        print("Hello")
    }
    
    @State var showingPopover = false

    var body: some View {
        @State var selectedDate = Date()
        
        
        VStack() {
            HStack() {
                HStack() {
                    Text(currentDate).font(.headline)
                    Button(action: {
                        showingPopover.toggle()
                    }) {
                        Image(systemName: "chevron.down.circle.fill").symbolRenderingMode(.hierarchical)
                    }
                    .popover(isPresented: $showingPopover) {
                        DatePicker("Date", selection: $selectedDate).padding()

                    }
                }
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button(action: test) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    
                    
                    Menu {
                        Button(action: test) {
                            Label("What's changed", systemImage: "clock.arrow.circlepath")
                        }
                        Button(action: test) {
                            Label("How to use", systemImage: "menucard.fill")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
             
            }
            
            Spacer().frame(height: 12)
            
            VStack() {
                Divider()
                HStack() {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle().fill(.gray).frame(width: 28)
                            Image(systemName: "fork.knife").font(.system(size: 14, weight: .bold))

                        }
                        Text("Eat food").font(.subheadline).fontWeight(.semibold)
                    }
               
                    Spacer()
                    
                    Text("12:40PM").font(.footnote)
                }
            }
            VStack() {
                Divider()
                HStack() {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle().fill(.gray).frame(width: 28)
                            Image(systemName: "cup.and.saucer.fill").font(.system(size: 12, weight: .bold))
                        }
                        
                        Text("Drank coffee").font(.subheadline).fontWeight(.semibold)
                        
                        Image(systemName: "text.bubble").font(.system(size: 12, weight: .regular)).foregroundStyle(.secondary)
                    }
               
                    Spacer()
                    
                    Text("12:40PM").font(.footnote)
                }
            }
            Divider()
          
            
          
            Spacer()
            
            HStack() {
                Button(action: test) {
                    Label("Add entry", systemImage: "plus.circle.fill").bold()
                }
                
                Spacer()
                
                Button(action: test) {
                    Text("Today")
                }
            }

            
        }.padding()
    
        
       
    }

//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
