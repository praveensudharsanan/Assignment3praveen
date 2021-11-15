//
//  ViewController.swift
//  ImageViewer
//
//  Created by user199544 on 11/9/21.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,AddingImageDelegateProtocol{
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var image_picker: UIPickerView!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aVC = segue.destination as! AddNewImageViewController
        aVC.delegate = self
    }
    func controllerDidFinishWithNewImage(si: Imageinfo) {
        manager.addNewImages(ns: si)
        image_picker.reloadAllComponents()
        
    }
    
    func controllerDidCancel() {
        
    }
 
    var manager: ImageManager = ImageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        let imageUrl = URL(string:manager.listOfImages[row].url)!
        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        
        func downloadImage(from url: URL) {
            print("Download Started")
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print("Download Finished")
                // always update the UI from the main thread
                DispatchQueue.main.async() { [weak self] in
                    self?.showImage.image = UIImage(data: data)
                }
            }
        }
        downloadImage(from: imageUrl)
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return 100
        return manager.getAllImages().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return "iOS"
        return manager.getAllImages()[row].name
    }
    
    

}

