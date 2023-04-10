//
//  CourseDetailView.swift
//  CustomTransition
//
//  Created by Arthur ? on 10.04.2023.
//

import SwiftUI

struct CourseDetailView: View {
    var namespace: Namespace.ID
    @Binding var isShowing: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .foregroundStyle(.black)
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
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask", in: namespace)
            )
            .overlay(
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
                    Divider()
                    HStack {
                        Image(systemName: "person")
                            .font(.headline)
                            .padding(5)
                            .background(
                                .white,
                                in: RoundedRectangle(cornerRadius: 18, style: .continuous)
                            )
                        Text("Taught by Arthur Danilenko")
                            .font(.footnote)
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y: 250)
                .padding(10)
            )
            .overlay(
                Button(action: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        self.isShowing.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Circle().fill(.ultraThinMaterial))
                })
                .padding()
                , alignment: .topTrailing
            )
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetailView(namespace: namespace, isShowing: .constant(true))
    }
}
