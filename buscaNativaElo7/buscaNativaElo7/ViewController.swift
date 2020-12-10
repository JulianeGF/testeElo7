//
//  ViewController.swift
//  buscaNativaElo7
//
//  Created by shu on 25/11/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView()
    }
    private func searchView() {
        let request = Alamofire.request("https://5dc05c0f95f4b90014ddc651.mockapi.io/elo7/api/1/products")
            
            request.responseJSON { (data) in
              print(data)
            }
    }

}

