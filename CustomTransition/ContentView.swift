//
//  ContentView.swift
//  CustomTransition
//
//  Created by Arthur ? on 10.04.2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State private var isShowingDetails: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    Text("Featured")
                        .font(.largeTitle.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .bottom])
                    
                    Image("sea-waves")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            VStack(alignment: .leading, spacing: 12) {
                                Text("iOS news")
                                    .font(.largeTitle.weight(.bold))
                                Text("march 2023".uppercased())
                                    .font(.footnote.weight(.semibold))
                                Text("New features available with iOS 16. iOS 16 enhances iPhone with all‑new personalization features, deeper intelligence, and seamless ways to communicate and share.")
                                    .font(.footnote)
                            }
                                .foregroundColor(.white)
                                .padding(20)
                            , alignment: .bottomLeading
                        )
                        .padding([.horizontal, .bottom], 20)

                    if !isShowingDetails {
                        CourseCellView(namespace: namespace, isShowing: $isShowingDetails)
                    } else {
                        Color.clear.frame(height: 300).padding(20)
                    }
                }
            }
            
            if isShowingDetails {
                CourseDetailView(namespace: namespace, isShowing: $isShowingDetails)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
