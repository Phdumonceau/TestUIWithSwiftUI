//
//  ReusableImageRow.swift
//  TestUIWithSwiftUI
//
//  Created by Philippe Du Monceau on 17/12/24.
//

import SwiftUI

struct ReusableImageRow: View {
    let imageName: String
    let title: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            Text(title)
                .font(.subheadline)
                .bold()
            Spacer()
        }
        .padding()
    }
}
