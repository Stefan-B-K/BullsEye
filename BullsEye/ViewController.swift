
import UIKit

class ViewController: UIViewController {
  
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  @IBOutlet var slider: UISlider!
  @IBOutlet var targetLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewGame()
    
    let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
    slider.setThumbImage(thumbImageNormal, for: .normal)
    
    let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    let trackLeftImage = UIImage(named: "SliderTrackLeft")!
    let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackRightImage = UIImage(named: "SliderTrackRight")!
    let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    
  }
  
  @IBAction func showAlert() {
    let difference = abs(currentValue - targetValue)
    let points = 100 - difference + (difference == 0 ? 100: difference == 1 ? 50 : 0)
    
    let title: String
    switch difference {
    case 0 : title = "Перфектно!"
    case 1...5: title = "Почти уцелихте"
    case 6...10: title = "Горе-долу добре"
    default: title = "Далеч от целта"
    }
    score += points
    
    let message = "Получавате \(points) точки"
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Добре", style: .default) {_ in
      self.startNewRound()
    }
    alert.addAction(action)
    present(alert, animated: true)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func startNewGame() {
    score = 0
    round = 0
    startNewRound()
  }
  
  func startNewRound() {
    round += 1
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
    let transition = CATransition()
    transition.type = CATransitionType.fade
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    view.layer.add(transition, forKey: nil)
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
}

