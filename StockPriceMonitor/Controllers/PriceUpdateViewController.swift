import UIKit

class PriceUpdateViewController: UIViewController {
    
    private enum PriceConstants {
        static let increment: Double = 10.0
        static let minRandomPrice: Double = 50.0
        static let maxRandomPrice: Double = 500.0
    }
    
    var stock: Stock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func increasePrice(_ sender: Any) {
        guard let stock = stock else { return }
        stock.price += PriceConstants.increment
    }
    
    @IBAction func decreasePrice(_ sender: Any) {
        guard let stock = stock else { return }
        stock.price -= PriceConstants.increment
    }
    
    @IBAction func setRandomPrice(_ sender: Any) {
        guard let stock = stock else { return }
        stock.price = Double.random(in: PriceConstants.minRandomPrice...PriceConstants.maxRandomPrice)
    }
}
