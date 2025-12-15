import UIKit

class PriceViewerAViewController: UIViewController {
    
    var stock: Stock?
    private var isObserving = false
    
    @IBOutlet weak var updatedPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObserver()
        updatePriceLabel()
    }
    
    private func setupObserver() {
        guard let stock = stock else { return }
        stock.addObserver(self, forKeyPath: "price", options: [.new, .initial], context: nil)
        isObserving = true
    }
    
    private func updatePriceLabel() {
        guard let stock = stock else { return }
        updatedPriceLabel?.text = formatPrice(stock.price)
    }
    
    private func formatPrice(_ price: Double) -> String {
        return String(format: "%.2f", price)
    }
    
    override func observeValue(forKeyPath keyPath: String?, 
                               of object: Any?, 
                               change: [NSKeyValueChangeKey : Any]?, 
                               context: UnsafeMutableRawPointer?) {
        guard keyPath == "price",
              let newPrice = change?[.newKey] as? Double else {
            return
        }
        
        updateLabelOnMainThread(newPrice)
    }
    
    private func updateLabelOnMainThread(_ price: Double) {
        if Thread.isMainThread {
            updatedPriceLabel?.text = formatPrice(price)
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.updatedPriceLabel?.text = self?.formatPrice(price)
            }
        }
    }
    
    deinit {
        if isObserving, let stock = stock {
            stock.removeObserver(self, forKeyPath: "price")
        }
    }
}
