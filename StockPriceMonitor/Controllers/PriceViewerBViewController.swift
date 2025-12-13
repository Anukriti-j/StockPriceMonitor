import UIKit

class PriceViewerBViewController: UIViewController {
    
    var stock: Stock!
    private var isObserving = false
    @IBOutlet weak var updatedPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stock.addObserver(self, forKeyPath: "price", options: [.new], context: nil)
        isObserving = true
        updatedPriceLabel.text = "\(stock.price)"
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "price", let newPrice = change?[.newKey] as? Double {
            DispatchQueue.main.async {
                self.updatedPriceLabel.text = "\(newPrice)"
            }
        }
    }
    
    deinit {
        if isObserving {
            stock.removeObserver(self, forKeyPath: "price")
        }
    }
}
