import UIKit

class HomeViewController: UIViewController {
    let stock = Stock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stock Price Monitor"
    }
    
    @IBAction func openUpdater(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PriceUpdateViewController") as! PriceUpdateViewController
        vc.stock = stock
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewPriceA(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PriceViewerAViewController") as! PriceViewerAViewController
        vc.stock = stock
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openPriceB(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PriceViewerBViewController") as! PriceViewerBViewController
        vc.stock = stock
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

