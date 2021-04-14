//
//  SwiftUIDebugUtil.swift
//  TwtClip
//
//  Created by Tomoaki Yagishita on 2020/09/03.
//

import Foundation
import SwiftUI

extension View {
  public func debugAction(_ closure: () -> Void) -> Self {
    #if DEBUG
    closure()
    #endif
    
    return self
  }
}
extension View {
  public func debugPrint(_ value: Any) -> Self {
    debugAction { print(value) }
  }
}

extension View {
  public func debugModifier<T: View>(_ modifier: (Self) -> T) -> some View {
    #if DEBUG
    return modifier(self)
    #else
    return self
    #endif
  }
}

extension View {
  public func debugBorder(_ color: Color = .red, width: CGFloat = 1) -> some View {
    debugModifier {
      $0.border(color, width: width)
    }
  }
  
  public func debugBackground(_ color: Color = .red) -> some View {
    debugModifier {
      $0.background(color)
    }
  }
}

// util for preview
// Usage:
// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//            .landscape()
//        ContentView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
//            .landscape()
//        ContentView() // iPhone 12 Pro
//            .landscape()
//    }
// }
struct LandscapeModifier: ViewModifier {
    let height = UIScreen.main.bounds.width
    let width = UIScreen.main.bounds.height
    
    var isPad: Bool { // 1
        return height >= 768
    }

    var isRegularWidth: Bool { // 2
        return height >= 414
    }
    
    func body(content: Content) -> some View {
        content
            .previewLayout(.fixed(width: width, height: height))
            .environment(\.horizontalSizeClass, isRegularWidth ? .regular: .compact) // 5
            .environment(\.verticalSizeClass, isPad ? .regular: .compact) // 6
    }
}

extension View {
    public func landscape() -> some View {
        self.modifier(LandscapeModifier())
    }
}
