
import UIKit
import WebKit

class InfoViewController: UIViewController {
  
  @IBOutlet var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html")  {
      webView.loadFileURL(url, allowingReadAccessTo: url)
    }
  }
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
  
  
}
