//
//  FirstViewController.swift
//  DenGiaoThong
//
//  Created by Chu Du on 16/06/2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var thanDenView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redTexField: UITextField!
    @IBOutlet weak var yellowTexField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var runButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
    }
    
    func setUpUI() {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        headerView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        headerLabel.text = "CẤU HÌNH ĐÈN"
        headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        headerLabel.textAlignment = .center
        headerLabel.textColor = .white
        
        subView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        thanDenView.backgroundColor = .black
        thanDenView.layer.cornerRadius = 10
        
        redView.backgroundColor = .red
        redView.layer.cornerRadius = redView.bounds.height/2
        
        yellowView.backgroundColor = .yellow
        yellowView.layer.cornerRadius = yellowView.bounds.height/2
        
        greenView.backgroundColor = .green
        greenView.layer.cornerRadius = greenView.bounds.height/2
        
        redTexField.placeholder = "Đèn đỏ"
        redTexField.keyboardType = .numberPad
        redTexField.backgroundColor = .white
        
        yellowTexField.placeholder = "Đèn vàng"
        yellowTexField.keyboardType = .numberPad
        yellowTexField.backgroundColor = .white
        
        greenTextField.placeholder = "Đèn xanh"
        greenTextField.keyboardType = .numberPad
        greenTextField.backgroundColor = .white
        
        runButton.setTitle("Chạy", for: .normal)
        runButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        runButton.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        runButton.setTitleColor(.white, for: .normal)
        runButton.layer.cornerRadius = 10
    }
    
    @IBAction func runOnPress(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let seconVC = storyboard.instantiateViewController(identifier: "SecondViewController") as SecondViewController
        
        guard let redTime = redTexField.text, let yellowTime = yellowTexField.text, let greenTime = greenTextField.text else {
            return
        }
        
        
        seconVC.modalPresentationStyle = .fullScreen
        
        seconVC.data = (redTime, yellowTime, greenTime)
        
        self.present(seconVC, animated: true, completion: nil)
        
    }
    
}
