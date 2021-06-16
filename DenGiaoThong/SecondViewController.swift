//
//  SecondViewController.swift
//  DenGiaoThong
//
//  Created by Chu Du on 16/06/2021.
//

import UIKit

enum Time {
    case Start
    case Pause
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var thanDenView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var data:(redTime:String, yellowTime:String, greenTime:String)?
    var timeType:Time = .Start
    var timer:Timer!
    var countRed:Int = 0
    var countGreen:Int = 0
    var countYellow:Int = 0
    var totalTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        guard let dataN = data, let redTime = Int(dataN.redTime), let yellowTime = Int(dataN.yellowTime), let greenTime = Int(dataN.greenTime) else {
            return
        }
        
        countRed = redTime
        countGreen = greenTime
        countYellow = yellowTime
        totalTime = redTime + greenTime + yellowTime
    }
    
    @objc func runLoop() {
        switch totalTime {
        case (countGreen + countYellow + 1)...(countRed + countGreen + countYellow):
            runRed()
        case (countYellow + 1)...(countGreen + countYellow):
            runGreen()
        case 1...countYellow:
            runYellow()
        default:
            totalTime = countRed + countGreen + countYellow
            runRed()
        }
    }
    
    func setUpUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        thanDenView.backgroundColor = .black
        thanDenView.layer.cornerRadius = 10
        
        timeView.backgroundColor = .white
        timeView.layer.cornerRadius = timeView.bounds.height/2
        timeLabel.text = "0"
        timeLabel.textColor = .black
        timeLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        timeLabel.textAlignment = .center
        
        redView.backgroundColor = .red
        redView.layer.cornerRadius = redView.bounds.height/2
        redView.alpha = 0.5
        
        yellowView.backgroundColor = .yellow
        yellowView.layer.cornerRadius = yellowView.bounds.height/2
        yellowView.alpha = 0.5
        
        greenView.backgroundColor = .green
        greenView.layer.cornerRadius = greenView.bounds.height/2
        greenView.alpha = 0.5
        
        changeButton.setTitle("Chạy", for: .normal)
        changeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        changeButton.setTitleColor(.white, for: .normal)
        changeButton.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        changeButton.layer.cornerRadius = 10
        
        backButton.setTitle("Cài đặt", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        backButton.layer.cornerRadius = 10
    }
    
    func runRed() {
        if (totalTime - countGreen - countYellow) > 99 {
            timeLabel.text = "99"
        } else {
            timeLabel.text = String(totalTime - countGreen - countYellow)
        }
        redView.alpha = 1
        yellowView.alpha = 0.5
        greenView.alpha = 0.5
        totalTime -= 1
    }
    
    func runGreen() {
        if (totalTime - countYellow) > 99 {
            timeLabel.text = "99"
        } else {
            timeLabel.text = String(totalTime - countYellow)
        }
        greenView.alpha = 1
        redView.alpha = 0.5
        yellowView.alpha = 0.5
        totalTime -= 1
    }
    
    @objc func runYellow() {
        if totalTime > 99 {
            timeLabel.text = "99"
        } else {
            timeLabel.text = String(totalTime)
        }
        yellowView.alpha = 1
        greenView.alpha = 0.5
        redView.alpha = 0.5
        totalTime -= 1
    }
    
    @IBAction func changeOnPress(_ sender: Any) {
        if timeType == Time.Start {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runLoop), userInfo: nil, repeats: true)
            changeButton.setTitle("Dừng", for: .normal)
            timeType = Time.Pause
        } else {
            changeButton.setTitle("Chạy", for: .normal)
            timeType = Time.Start
            timer.invalidate()
        }
    }
    
    @IBAction func backOnPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
