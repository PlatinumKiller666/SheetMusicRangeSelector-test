//
//  SheetView.swift
//  SheetMusicRangeSelector
//
//  Created by Kirill Zolotarev on 30.12.2025.
//

import SwiftUI

struct SheetView: View {
	var selected: Bool = false
	var sheet = Sheet()
    var body: some View {
		ZStack(alignment: .center){
			if selected {
				HStack(spacing: 0.0){
					Image(ImageResource.leftHandle).resizable().frame(width: 9, height: 124)
					Image(ImageResource.loopSelection)
					Image(ImageResource.rightHandle).resizable().frame(width: 9, height: 124)
				}
			}
			HStack(alignment: .center){
				Spacer()
				Image(sheet.place).resizable().frame(width: 200, height: 100)
				Spacer()
			}
		}
		.frame(height: 154.0)
    }
}

#Preview {
    SheetView()
}
