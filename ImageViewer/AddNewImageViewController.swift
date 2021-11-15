//
//  AddNewImageViewController.swift
//  ImageViewer
//
//  Created by user199544 on 11/9/21.
//

import UIKit
protocol AddingImageDelegateProtocol {
    func controllerDidFinishWithNewImage(si: Imageinfo)// did , will ,
    func controllerDidCancel()
}

class AddNewImageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var image_name: UITextField!
    @IBOutlet weak var image_url: UITextField!
    public var delegate: AddingImageDelegateProtocol?
   

    @IBAction func AddButton(_ sender: Any) {
        if let name = image_name.text {
            if let url = image_url.text {
                if !name.isEmpty && !url.isEmpty{
                    if url != nil{
                        let newImage = Imageinfo(n: name, g: url)
                        print (newImage.name)
                        delegate?.controllerDidFinishWithNewImage(si: newImage)
                        dismiss(animated: true, completion: nil)
                    }
                    
                    
                }
            }
        }
        
    }
    @IBAction func CancelButton(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
