import UIKit
import SnapKit

class ViewAnimationForRows {
    static func animate(cell: UITableViewCell) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                           cell.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                       }, completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               cell.transform = CGAffineTransform.identity
                           }
                       })
    }
}
