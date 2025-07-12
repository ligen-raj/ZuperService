//
//  View + Extensions.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func scrollBounceBehaviorBasedOnSize() -> some View {
        if #available(iOS 16.4, *) {
            scrollBounceBehavior(.basedOnSize)
        }
    }
    
    @ViewBuilder func active(if condition: Bool) -> some View {
        if condition {
            self
        }
    }
    
}
