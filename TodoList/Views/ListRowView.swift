//
//  ListRowView.swift
//  TodoList
//
//  Created by Aditya Ghorpade on 02/12/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle( item.isCompleted == true ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}

#Preview {
    ListRowView(item: ItemModel(title: "Hello", isCompleted: true))
}
