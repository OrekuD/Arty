//
//  Fonts.swift
//  Arty
//
//  Created by David Opoku  on 08/07/2023.
//

import Foundation
import SwiftUI

struct FontFamilies {
    static let regular: String = "DMSans-Regular"
    static let bold: String = "DMSans-Bold"
    static let medium: String = "DMSans-Medium"
}

struct Fonts {
    static let hero: Font = .custom(FontFamilies.bold, size: 30);
    static let largeTitle: Font = .custom(FontFamilies.bold, size: 40);
    static let title1: Font = .custom(FontFamilies.bold, size: 28);
    static let title2: Font = .custom(FontFamilies.bold, size: 22);
    static let title3: Font = .custom(FontFamilies.bold, size: 20);
    static let headline: Font = .custom(FontFamilies.bold, size: 17);
    static let subhead: Font = .custom(FontFamilies.bold, size: 15);
    static let callout: Font = .custom(FontFamilies.regular, size: 16);
    static let body: Font = .custom(FontFamilies.regular, size: 17);
    static let footnote: Font = .custom(FontFamilies.regular, size: 13);
    static let caption1: Font = .custom(FontFamilies.regular, size: 12);
    static let caption2: Font = .custom(FontFamilies.regular, size: 11);
}
