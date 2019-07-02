//
//  ViewController.swift
//  Magic Recipe
//
//  Created by Sunil Kumar on 01/07/19.
//  Copyright © 2019 Sunil Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var urlString = "http://www.recipepuppy.com/api/"
    @IBOutlet var ingredientSearchBar: UISearchBar!
    @IBOutlet var recipeSearchButton: UIButton!
    @IBOutlet var jsonTextView: UITextView!
    @IBOutlet var searchContentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        jsonTextView.layer.cornerRadius = 10
        jsonTextView.isHidden = true
        jsonTextView.layer.masksToBounds = true
        
        searchContentView.layer.cornerRadius = 10
        searchContentView.layer.masksToBounds = true
        
        recipeSearchButton.layer.cornerRadius = recipeSearchButton.frame.height / 2.0
        recipeSearchButton.layer.masksToBounds = true
    }
    
    @IBAction func recipeSearchAction(_ sender: UIButton) {
        searchContentView.frame = CGRect(x: 20, y: 50, width: 374, height: 150)
        
        jsonTextView.isHidden = false
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let _ = response {
                //print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    DispatchQueue.main.async { // Correct
                        //self.jsonTextView.text = "\(data.count) bytes downloaded"
                        self.jsonTextView.text = "\(self.jsonTextView.text ?? "\n")\(json)\n"
                    }
                } catch {
                    print(error)
                }
            }
            }.resume()
        print("Clicked")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.recipeSearchButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.recipeSearchButton.transform = CGAffineTransform.identity
        }, completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
