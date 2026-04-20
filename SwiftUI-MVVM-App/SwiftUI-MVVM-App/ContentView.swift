//
//  ContentView.swift
//  SwiftUI-Learning
//
//  Created by Gourav Joshi on 22/03/26.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack {
         Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
         Text("Hello, world!")
      }
      .padding()
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
