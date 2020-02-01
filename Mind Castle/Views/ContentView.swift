//
//  ContentView.swift
//  Mind Castle
//
//  Created by Adrien Wilkins on 2020/01/30.
//  Copyright © 2020 Adrien Wilkins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            // I actually want this first view to be a user selected option
            // This would mean that you could select what goes in the ledger spot.
            Ledger() // TODO: Make this selection user preferance
            DropIn()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
