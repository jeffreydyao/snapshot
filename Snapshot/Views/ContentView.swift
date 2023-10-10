//
//  ContentView.swift
//  Snapshot
//
//  Created by Jeffrey Yao on 10/10/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // @Environment(\.modelContext) private var modelContext
    // @Query private var items: [Item]
    
    @ObservedObject private var viewModel = BehaviorViewModel()
    @State private var newBehaviorName = ""
    @State private var selectedDate = Date()
    
    init() {
        viewModel = BehaviorViewModel()
    }
    
    func test() {
        print("Hello")
    }
    
    @State var showingPopover = false

    var body: some View {
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
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        return dateFormatter.string(from: selectedDate)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
