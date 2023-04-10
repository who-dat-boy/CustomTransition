//
//  MatchedView.swift
//  CustomTransition
//
//  Created by Arthur ? on 10.04.2023.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var isShowing = false
    
    var body: some View {
        ZStack {
            if !isShowing {
                CourseCellView(namespace: namespace, isShowing: $isShowing)
            } else {
                CourseDetailView(namespace: namespace, isShowing: $isShowing)
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                self.isShowing.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
