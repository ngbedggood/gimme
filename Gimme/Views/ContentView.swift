//
//  ContentView.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 25/08/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @ObservedObject var viewModel: RecipeViewModel
    @Query private var items: [Ingredient]
    
    @State private var showSheet: Bool = false
    @State private var sheetHeight: CGFloat = .zero
    
    
    // List related
    @State private var sortKey: SortKey = .expiry
    @State private var ascending: Bool = true
    
    enum SortKey {
        case name, quantity, expiry
    }
    
    var sortedItems: [Ingredient] {
        let sorted: [Ingredient]
        switch sortKey {
        case .name:
            sorted = items.sorted { ascending ? $0.name < $1.name : $0.name > $1.name }
        case .quantity:
            sorted = items.sorted { ascending ? $0.quantity < $1.quantity : $0.quantity > $1.quantity }
        case .expiry:
            sorted = items.sorted { ascending ? $0.expiryDate < $1.expiryDate : $0.expiryDate > $1.expiryDate }
        }
        return sorted
    }
    
    let show = true
    

    var body: some View {
        VStack {
            VStack{
                HStack {
                    Button("Name"){
                        print("name")
                        if sortKey == .name {
                            ascending.toggle()
                        } else {
                            sortKey = .name; ascending = true
                        }
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.gray))
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button("Quantity"){
                        print("name")
                        if sortKey == .quantity {
                            ascending.toggle()
                        } else {
                            sortKey = .quantity; ascending = true
                        }
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.gray))
                    )
                    .frame(width: 100, alignment: .trailing)
                    
                    Button("Expiry"){
                        print("name")
                        if sortKey == .expiry {
                            ascending.toggle()
                        } else {
                            sortKey = .expiry; ascending = true
                        }
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.gray))
                    )
                    .frame(width: 100, alignment: .trailing)
                    
                }
                .foregroundColor(.white)
                    List {
                        ForEach(sortedItems) { item in
                            HStack {
                                Text(item.name)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(item.quantity, specifier: "%.0f")\(item.unit.rawValue)")
                                    .frame(width: 100, alignment: .trailing)
                                Text(item.expiryDate, format: .relative(presentation: .named))
                                    .frame(width: 100, alignment: .trailing)
                            }
                        }
                        .onDelete(perform: delete)
                    }
//                    .background(
//                        RoundedRectangle(cornerRadius: 20)
//                            .fill(.white)
//                    )
                    .listStyle(.plain)
                HStack(){
                    Spacer()
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("+")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(
                        Circle()
                            .fill(.green)
                    )
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.2))
            )
            .padding()
            Button {
                viewModel.fetchRecipe()
            } label: {
                Text("Gimme a Recipe!")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.green)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .sheet(isPresented: $showSheet) {
            IngredientSheetView { name, amount, unit, date in
                print("The sheet returned: \(name), \(amount)\(unit.rawValue), \(date)")
                viewModel.addItem(name: name, quantity: amount, unit: unit, date: date)
            }
            //.fixedSize(horizontal: false, vertical: true)
            //.modifier(GetViewHeightModifier(height: $sheetHeight))
            .presentationDetents([.medium])
        }
        
    }

    // This private bridge function lets the onDelete handler call the ViewModel.
    private func delete(offsets: IndexSet) {
        withAnimation {
            viewModel.deleteItems(offsets: offsets, from: items)
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: Ingredient.self)
        let viewModel = RecipeViewModel(modelContext: container.mainContext)
        
    ContentView(viewModel: viewModel)
        .modelContainer(container)
}
