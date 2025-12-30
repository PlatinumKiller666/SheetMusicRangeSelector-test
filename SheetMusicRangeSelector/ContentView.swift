//
//  ContentView.swift
//  SheetMusicRangeSelector
//
//  Created by Kirill Zolotarev on 30.12.2025.
//

import SwiftUI

struct ContentView: View {
	@State private var selected: UUID?
    var body: some View {
        ListOfSheets(selected: $selected)
    }
}

#Preview {
    ContentView()
}
