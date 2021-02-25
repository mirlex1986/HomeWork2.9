//
//  ViewController.swift
//  HomeWork2.9
//
//  Created by Алексей on 24.02.2021.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var runAnimationButton: UIButton!
    @IBOutlet var animatedView: SpringView!
    
    @IBOutlet var animationNameLabel: UILabel!
    @IBOutlet var animationDelayLabel: UILabel!
    @IBOutlet var animationForceLabel: UILabel!
    @IBOutlet var animationDurationLabel: UILabel!
    @IBOutlet var AnimationCurveLabel: UILabel!
    
    let animation = Spring.AnimationPreset.allCases
    let curve = Spring.AnimationCurve.allCases
    var animationIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonText()
    }

    @IBAction func runAnimationButtonPressed() {
        getAnimationName()
        setAnimaionParameters()
        
        
        setTextLabels()
        animatedView.animate()
        setButtonText()
    }

    private func getAnimationName() {
        if animationIndex < animation.count - 1 {
            animatedView.animation = animation[animationIndex].rawValue
            animationIndex += 1
        } else {
            animatedView.animation = animation[animationIndex].rawValue
            animationIndex = 0
        }
    }
    
    private func setAnimaionParameters() {
        animatedView.curve = curve[Int.random(in: 0...curve.count - 1)].rawValue
        
        animatedView.delay = CGFloat.random(in: 0...1)
        animatedView.force = CGFloat.random(in: 1...2)
        animatedView.duration = CGFloat.random(in: 1...3)
    }
    
    private func setTextLabels() {
        animationNameLabel.text = "Name: \(animatedView.animation)"
        animationDelayLabel.text = "Delay: " + String(format: "%.2f", animatedView.delay)
        animationDurationLabel.text = "Duration: " + String(format: "%.2f", animatedView.duration)
        animationForceLabel.text = "Force: " + String(format: "%.2f", animatedView.force)
        AnimationCurveLabel.text = "Curve: \(animatedView.curve)"
    }

    private func setButtonText() {
        runAnimationButton.setTitle("Run \(animation[animationIndex].rawValue)", for: .normal)
    }
}


