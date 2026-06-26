//
//  EmptyTaskView.swift
//  DoItNow
//
//  Created by Yusuf Akinci on 25.06.26.
import SwiftUI

struct EmptyTaskView: View {

    var body: some View {

        VStack(spacing: 20) {

            Image(systemName: "checklist")
                .font(.system(size: 44))
                .foregroundStyle(.indigo)

            Text("No Tasks Yet")
                .font(.title3.bold())

            Text("Tap the + button to create your first task.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(40)
        .frame(maxWidth: .infinity)
    }
}
