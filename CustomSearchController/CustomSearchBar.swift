//
//  CustomSearchBar.swift
//  CustomSearchController
//
//  Created by Julien Hoachuck on 8/20/15.
//  Copyright (c) 2015 Pandodroid. All rights reserved.
//
import Foundation
import UIKit

class CustomSearchBar: UISearchBar {
    
    init(){
        super.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setShowsCancelButton(showsCancelButton: Bool, animated: Bool) {
        // Void
    }
    
    
    // if you want to draw custom border, uncomment below codes  
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        
        if let searchBarIndex = indexOfSearchBar() {
            
            if let index = indexOfSearchFieldInSubviews(searchBarIndex) {
                
                let searchBarView = self.subviews[searchBarIndex]
                
                if let searchField: UITextField = searchBarView.subviews[index] as? UITextField {
                    searchField.background = nil
                    searchField.backgroundColor = UIColor.clearColor()
                    
                    let image = UIImage(named: "search_bg")?.resizableImageWithCapInsets(UIEdgeInsetsMake(4, 4, 4, 4))
                    image?.drawInRect(CGRectInset(rect, 0, 6), blendMode: .Normal, alpha: 1.0)
                }
            }
        }
    }
    
    func indexOfSearchBar() -> Int? {
        var index: Int? = nil
        
        for (i, subview) in self.subviews.enumerate() {
            if subview.isKindOfClass(UIView) {
                index = i
                break
            }
        }
        
        return index
    }

    func indexOfSearchFieldInSubviews(searchBarIndex : Int) -> Int? {
        
        var index: Int? = nil
        let searchBarView = subviews[searchBarIndex]
        
        for (i, subview) in searchBarView.subviews.enumerate() {
            if subview.isKindOfClass(UITextField) {
                index = i
                break
            }
        }
        
        return index
    }
}