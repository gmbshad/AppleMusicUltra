//
//  Theme.swift
//  Themes for Music
//
//  Created by Justin Bush on 2020-03-21.
//  Copyright © 2020 Justin Bush. All rights reserved.
//

import AppKit
import Foundation

struct Theme {
    /**
    Converts Theme properties to `[String]` array for saving with `UserDefaults`.
    
     - Parameters:
        - style: The active Style type (ie. `Style.preset`)
        - clear: The window's transparancy effects: `true` transparent; `false` will show background window objects (ie. `imageView`)
        - mode: Dark Mode: `true`, Light Mode: `false`
        - image: The String of the image for the blur background (empty String for no image)
     
     - Returns: String array of all Theme properties `[style, clear, mode, image] -> ["preset", "true", "false", ""]`
    
     # Usage
        let array = toArray(Style.preset, true, false, "")
        array = ["preset", "true", "false", ""]
     
        let style = array[0]
        let clear = array[1]
        let mode = array[2]
        let image = array[3]
     */
    static func toArray(_ style: Style, clear: Bool, mode: Bool, image: String) -> [String] {
        let styleString = style.name
        var clearTheme = "true"
        var themeIsDark = "true"
        if !clear { clearTheme = "false" }
        if !mode { themeIsDark = "false" }
        return [styleString, clearTheme, themeIsDark, image]
    }
    
    /**
    Sets Active variables from `[String]` array  of Theme properties
    
     - Parameters:
        - array: Array generated by the `toArray()` function
     
     - Returns: Sets ViewController's `Active` variables to their assigned Types and values
    
     # Usage
        let theme = toActive([String])
        // Returns Active.values:
        Active.style = array[0] as Style.Type
        Active.clear = array[1] as Bool
        Active.mode = array[2] as Bool
        Active.image = array[3] as String
     */
    static func toActive(_ array: [String]) {
        let style = array[0]
        let clear = array[1]
        let mode = array[2]
        let image = array[3]
        // Style -> Style.value
        Active.style = StyleHelper.toMaterial(style)
        // Clear: isTransparent =  true ? false
        if clear == "true" { Active.clear = true }
        else { Active.clear = false }
        // Mode: NSAppearance.isDark = true ? false
        if mode == "true" { Active.mode = true }
        else { Active.mode = false }
        // Image: String of image
        Active.image = image
    }
    
}


enum Themes {
    case wave
    case spring
    case dunes
    case quartz
    case silk
    case bubbles
    case goblin
    case purple
    case custom
}


enum Type {
    case transparent
    case image
    
    // if Type.isTransparent { imageView.isHidden = true }
    var isTransparent: Bool {
        switch self {
        case .transparent:
            return true
        case .image:
            return false
        }
    }
}
