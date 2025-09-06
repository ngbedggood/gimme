//
//  GetViewHeightModifier.swift
//  Gimme
//
//  Created by Nathaniel Bedggood on 06/09/2025.
//

import Foundation
import SwiftUI

struct GetViewHeightModifier: ViewModifier {
    @Binding var height: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
    }
}
