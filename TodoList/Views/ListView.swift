//
//  ListView.swift
//  TodoList
//
//  Created by Aditya Ghorpade on 02/12/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    //function to delete item using swipe action
//    func deleteItemUsingSwipeAction(item: ItemModel) {
//        items.removeAll(where: {$0.id == item.id})
//    }
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity
                        .animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
        //                    .swipeActions(edge: .trailing) {
        //                        Button("delete", role: .destructive) {
        //                            deleteItemUsingSwipeAction(item: item)
        //                        }
        //                    }
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateStatus(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        //.listStyle(PlainListStyle())
        .navigationTitle("To-Do List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}
