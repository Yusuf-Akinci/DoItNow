//
//  CTAButton.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 25.06.26.
//

import SwiftUI

struct CTAButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action){
            Text(title)
        }
    }
}

#Preview {
    CTAButton(title: "Confirm") {}
}
