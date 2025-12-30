//
//  Handler.swift
//  SheetMusicRangeSelector
//
//  Created by Kirill Zolotarev on 30.12.2025.
//

import SwiftUI

struct Handler: View {
	var body: some View {
		GeometryReader { geometry in
			contentView(geometry: geometry)
			RingLine(title: "test", startPosition: 10.0, endPosition: geometry.size.width - 20.0, goToNext: false)
		}
	}
}

func contentView(geometry: GeometryProxy) -> some View {
	let content = VStack {
		ZStack {
			LineAndText()
				.stroke()
		}
	}
	return content
}

struct LineAndText: Shape {
	func path(in rect: CGRect) -> Path {
		Path { path in
			path.move(to: CGPoint(x: 0, y: rect.size.height / 2))
			path.addLine(to: CGPoint(x: rect.width, y: rect.size.height / 2))
			
			let label = "label"
			label.draw(at: CGPoint(x:0, y:rect.size.height / 2))
		}
	}
}

struct RingLine: View {
	let title: String
	let startPosition: CGFloat
	let endPosition: CGFloat
	let goToNext: Bool
	let font: Font = .largeTitle
	
	let topOffset: CGFloat = 8.0
	let leftOffset:CGFloat = 8.0
	
	@State var canvasWidth:CGFloat = 0.0
	@State var canvasCenterY:CGFloat = 0.0
	
	var body: some View {
		GeometryReader { geometry in
			Canvas { context, size in
				let text = Text(title)
					.font(font)
					.foregroundStyle(.gray)
				let resolvedText = context.resolve(text)
				let sizeR = resolvedText.measure(in: size)
				let canvasCenterY = topOffset + sizeR.height
				
				let canvasCenter = CGPoint(x: leftOffset + sizeR.width/2.0, y: canvasCenterY)
				
				self.canvasWidth = sizeR.width + leftOffset * 2.0
				self.canvasCenterY = canvasCenterY
				
				context.draw(text, at: canvasCenter, anchor: .center)
			}
			Path { path in
				path.move(to: CGPoint(x: canvasWidth, y: canvasCenterY))
				path.addLine(to: CGPoint(x:geometry.size.width - 8.0, y: canvasCenterY))
			}
		}
	}
}

#Preview {
    Handler()
}
