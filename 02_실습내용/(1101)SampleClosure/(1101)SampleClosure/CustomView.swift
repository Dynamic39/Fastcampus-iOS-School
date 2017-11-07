
import UIKit

class CustomView: UIView {

    
    @IBOutlet weak var button:UIButton!
    //클로져 옵셔널 타입을 생성함!!
    var didTapClosure: ((String) -> Void)?
    
    @IBAction func didTapButton(_ sender: Any) {
        
        didTapClosure?("하이요!!")
        
    }
    
    
}
