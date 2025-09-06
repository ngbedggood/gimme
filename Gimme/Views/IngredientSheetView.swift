//
//  IngredientSheetView.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 06/09/2025.
//

import SwiftUI

struct IngredientSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var amount: Double = 0.0
    @State private var selectedUnit: UnitType = .grams
    @State private var date = Date()
    
    var onSave: (String, Double, UnitType, Date) -> Void
    
    var body: some View {
        VStack {
            Text("Add an Item")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            
            TextField("Name", text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray, lineWidth: 2)
                        
                )
            
            HStack {
                TextField("Quantity", value: $amount, format: .number)
                
                Picker("Unit", selection: $selectedUnit) {
                    ForEach(UnitType.allCases) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
                .pickerStyle(.menu)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 2)
                    
            )
            
            DatePicker(
                "Expiry Date",
                selection: $date,
                displayedComponents: .date
            )
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 2)
                    
            )
            
            Button {
                print("Added item: \(name) - \(amount)\(selectedUnit.rawValue) - \(date)")
                onSave(name, amount, selectedUnit, date)
                dismiss()
            } label: {
                Text("Add Item")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.green)
            )
        }
        .padding()
        
    }
}

#Preview {
    IngredientSheetView( onSave: {_,_,_,_ in })
}
