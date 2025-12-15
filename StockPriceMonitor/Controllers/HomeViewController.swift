import UIKit

class HomeViewController: UIViewController {
    
    private let stock = Stock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stock Price Monitor"
    }
    
    @IBAction func openUpdater(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PriceUpdateViewController") as? PriceUpdateViewController else {
            print("Error: Could not instantiate PriceUpdateViewController")
            return
        }
        vc.stock = stock
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewPriceA(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PriceViewerAViewController") as? PriceViewerAViewController else {
            print("Error: Could not instantiate PriceViewerAViewController")
            return
        }
        vc.stock = stock
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openPriceB(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PriceViewerBViewController") as? PriceViewerBViewController else {
            print("Error: Could not instantiate PriceViewerBViewController")
            return
        }
        vc.stock = stock
        navigationController?.pushViewController(vc, animated: true)
    }
}
