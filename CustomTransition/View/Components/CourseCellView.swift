//
//  CourseCellView.swift
//  CustomTransition
//
//  Created by Arthur ? on 10.04.2023.
//

import SwiftUI

struct CourseCellView: View {
    var namespace: Namespace.ID
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("SwiftUI course")
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("80 sections - 35 hours".uppercased())
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                    .font(.footnote.weight(.semibold))
                Text("Build an app for iOS 16 with custom layouts, animations and advanced user interactions to create a seamless and engaging user experience.")
                    .matchedGeometryEffect(id: "text", in: namespace)
                    .font(.footnote)
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .blur(radius: 60)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
        }
        .frame(height: 300)
        .foregroundStyle(.white)
        .background(
            Image("tree-icon")
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: "icon", in: namespace)
        )
        .background(
            Image("purple-waves-bg")
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .padding([.horizontal, .bottom], 20)
        .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                self.isShowing.toggle()
            }
        }
    }
}

struct CourseCellView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseCellView(namespace: namespace, isShowing: .constant(true))
    }
}
