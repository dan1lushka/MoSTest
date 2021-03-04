//
//  ShowViewExtension.swift
//  MoSTest
//
//  Created by Daniel Rybak on 04/03/2021.
//

import SwiftUI

struct Show: ViewModifier {
    @Binding var isVisible: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if isVisible {
            content
        } else {
            content.hidden()
        }
    }
}

extension View {
    func show(isVisible: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: Show(isVisible: isVisible))
    }
}
