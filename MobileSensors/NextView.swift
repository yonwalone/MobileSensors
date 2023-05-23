//
//  NextView.swift
//  MobileSensors
//
//  Created by Lukas Zwaller on 23.05.23.
//

import SwiftUI

struct NextView: View {
    var body: some View {
        VStack {
            Text("Next Page")
                .font(.largeTitle)
                .padding()

            Text("This is the next page content.")
                .padding()
        }
        .navigationBarTitle("My App")
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
