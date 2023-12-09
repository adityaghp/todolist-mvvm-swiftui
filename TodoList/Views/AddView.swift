//
//  AddView.swift
//  TodoList
//
//  Created by Aditya Ghorpade on 02/12/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dissmissCurrentView
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textFieldText: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("type something here...", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(
                        Color(UIColor.secondarySystemBackground)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer(minLength: 20)
                
                Button(action: {
                    if textFieldText.count != 0 {
                        listViewModel.addItem(title: textFieldText)
                        dissmissCurrentView()
                    } else {
                        showAlert.toggle()
                    }
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(16)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert("Please add an item!", isPresented: $showAlert) {}
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
