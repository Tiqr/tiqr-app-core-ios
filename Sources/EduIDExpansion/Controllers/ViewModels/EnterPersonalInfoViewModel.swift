import UIKit

class EnterPersonalInfoViewModel: NSObject {
    
    var setRequestButtonEnabled: ((Bool) -> Void)?
    var becomeFirstResponderClosure: ((Int) -> Void)?
    
    var validationMap: [Int: Bool] = [0:false, 1:false, 2: false] {
        didSet {
            var isTrue = true
            validationMap.forEach({ (key: Int, value: Bool) in
                if !value {
                    isTrue = false
                }
            })
            setRequestButtonEnabled?(isTrue)
        }
    }
    
}

//MARK: - textfield delegate
extension EnterPersonalInfoViewModel: ValidatedTextFieldDelegate {
    
    func updateValidation(with value: Bool, from tag: Int) {
        validationMap[tag] = value
    }
    
    func keyBoardDidReturn(tag: Int) {
        becomeFirstResponderClosure?(tag)
    }
}