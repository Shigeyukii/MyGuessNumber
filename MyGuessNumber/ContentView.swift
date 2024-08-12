//
//  ContentView.swift
//  MyGuessNumber
//
//  Created by user on 2024/07/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Game Start") {
                GameView()
            }
            .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
