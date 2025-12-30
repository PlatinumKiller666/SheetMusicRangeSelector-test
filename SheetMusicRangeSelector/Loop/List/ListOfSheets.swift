//
//  ListOfSheets.swift
//  SheetMusicRangeSelector
//
//  Created by Kirill Zolotarev on 30.12.2025.
//

import SwiftUI

struct ListOfSheets: View {
	@Binding var selected: UUID?
	
	let list = [Sheet(),
				Sheet(),
				Sheet(),
				Sheet(),
				Sheet()]
	
    var body: some View {
		List(list, id:\.uuid, selection: $selected) {sheet in
				SheetView(selected: sheet.uuid == selected)
				.listRowBackground(Color.clear)
				.listSectionSeparator(.hidden)
		  .listRowSeparator(.hidden)
//		  .listStyle(.plain)
		}
		.selectionDisabled(true)
    }
}

#Preview {
//    ListOfSheets()
}
