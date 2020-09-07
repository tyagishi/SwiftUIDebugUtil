//
//  SwiftUIDebugUtil.swift
//  TwtClip
//
//  Created by Tomoaki Yagishita on 2020/09/03.
//

import Foundation
import SwiftUI

extension View {
    func debugAction(_ closure: () -> Void) -> Self {
        #if DEBUG
        closure()
        #endif

        return self
    }
}
extension View {
    func debugPrint(_ value: Any) -> Self {
        debugAction { print(value) }
    }
}

extension View {
    func debugModifier<T: View>(_ modifier: (Self) -> T) -> some View {
        #if DEBUG
        return modifier(self)
        #else
        return self
        #endif
    }
}

extension View {
    func debugBorder(_ color: Color = .red, width: CGFloat = 1) -> some View {
        debugModifier {
            $0.border(color, width: width)
        }
    }

    func debugBackground(_ color: Color = .red) -> some View {
        debugModifier {
            $0.background(color)
        }
    }
}
