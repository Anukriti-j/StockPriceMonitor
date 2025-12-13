import UIKit

class PriceUpdateViewController: UIViewController {
    
    var stock: Stock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func increasePrice(_ sender: Any) {
        stock.price += 10
        print("\(stock.price)")
    }
    
    @IBAction func decreasePrice(_ sender: Any) {
        stock.price -= 10
        print("\(stock.price)")
        
    }
    
    @IBAction func setRandomPrice(_ sender: Any) {
        stock.price = Double.random(in: 50...500)
        print("\(stock.price)")
    }
}
