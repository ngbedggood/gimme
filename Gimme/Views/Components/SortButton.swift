//
//  SortButton.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 06/09/2025.
//

import SwiftUI

struct SortButton: View {
    let title: String
    let key: ContentView.SortKey
    @Binding var sortKey: ContentView.SortKey
    @Binding var ascending: Bool
    var body: some View {
        Button(title) {
            if sortKey == key {
                ascending.toggle()
            } else {
                sortKey = key
                ascending = true
            }
        }
        .frame(maxWidth: .infinity, alignment: key == .name ? .leading : .trailing)
        .font(.headline)
    }
}

#Preview {
    @Previewable @State var sortKey: ContentView.SortKey = .name
    @Previewable @State var ascending: Bool = true
    SortButton(
        title: "Test", key: .name, sortKey: $sortKey, ascending: $ascending )
    
}
