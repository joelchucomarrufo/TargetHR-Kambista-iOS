//
//  CustomTextFieldRoundedStyle.swift
//  TargetHRKambista
//
//  Created by Joel Martin Chuco Marrufo on 9/01/21.
//

import SwiftUI

struct CustomTextFieldRoundedStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 16, weight: .medium))
            .padding(8)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 3, style: .continuous).stroke(Color.black, lineWidth: 1)
            )
            .padding()
    }
}
