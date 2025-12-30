//
//  Cursor.swift
//  SheetMusicRangeSelector
//
//  Created by Kirill Zolotarev on 30.12.2025.
//

import SwiftUI

struct Cursor: View {
    var body: some View {
		ZStack {
			Image(ImageResource.backgroundCursor)
			VStack{
				Spacer().frame(height: 8.0)
				Image(ImageResource.topCursor)
					.frame(height: 13)
				Spacer()
			}
		}
		.frame(height: 101.0)
	}
}

#Preview {
    Cursor()
}
