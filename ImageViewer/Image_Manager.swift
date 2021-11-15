//
//  Image_Manager.swift
//  ImageViewer
//
//  Created by user199544 on 11/9/21.
//

import Foundation

class ImageManager {
    
    public var listOfImages = [Imageinfo]()
    
    func addNewImages(ns:Imageinfo){
        listOfImages.append(ns)
    }
    
    func getAllImages() -> [Imageinfo]{
        return listOfImages
    }
    
}
