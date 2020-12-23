//
//  ViewController.swift
//  buscaNativaElo7
//
//  Created by shu on 25/11/20.
//
import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let model = dataSource[indexPath.item]
        cell.titleLabel.text = model.title
        cell.priceLabel.text = model.price.current
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
   
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: [product] = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView()
    }
    
    private func searchView() {
        let request = Alamofire.request("https://5dc05c0f95f4b90014ddc651.mockapi.io/elo7/api/1/products")
            
        request.responseJSON { (response) in
            if let products = try? JSONDecoder().decode([product].self, from: response.data!) {
                self.dataSource = products
                self.tableView.reloadData()
            }
        }
            
    }
}

struct Price: Codable{
    let current: String
    let installment: String?
    let nonPromotional: String?
}
struct product: Codable {
    let _link: String
    let picture: String
    let title: String
    let price: Price
}
enum CodingKeys: String, Codable, CodingKey {
    case price
    case _link
    case picture
    case title
    }


