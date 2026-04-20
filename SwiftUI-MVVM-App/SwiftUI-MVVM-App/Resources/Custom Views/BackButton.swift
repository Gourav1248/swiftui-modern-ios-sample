//
//  BackButton.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 03/02/26.
//


import SwiftUI

struct BackButton: View {

    @SwiftUI.Environment(\.dismiss) private var dismissView

    var body: some View {
        Button {
          dismissView()
        } label: {
            Image(systemName: "chevron.left")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .padding(8)
        }
        .contentShape(Rectangle())
    }
}
