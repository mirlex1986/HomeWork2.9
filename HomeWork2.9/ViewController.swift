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
    
    let animation = Spring.AnimationPreset.allCases
    let curve = Spring.AnimationCurve.allCases
    
    var animationIndex = 0
    var parameter = Parameters()

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonText()
        randomNewParameters()
    }

    @IBAction func runAnimationButtonPressed() {
        getAnimationName()
        setAnimaionParameters()
        setTextLabels()
        
        animatedView.animate()
        
        setButtonText()
        randomNewParameters()
    }

    private func getAnimationName() {
        animatedView.animation = animation[animationIndex].rawValue
        
        if animationIndex < animation.count - 1 {
            animationIndex += 1
        } else {
            animationIndex = 0
        }
    }
    
    private func setAnimaionParameters() {
        animatedView.curve = curve[Int.random(in: 0...curve.count - 1)].rawValue
        animatedView.delay = CGFloat(parameter.delay)
        animatedView.force = CGFloat(parameter.force)
        animatedView.duration = CGFloat(parameter.duration)
    }
    
    private func setTextLabels() {
        animationNameLabel.text = """
            Name: \(animatedView.animation)
            Delay: \(String(format: "%.2f", animatedView.delay))
            Duration: \(String(format: "%.2f", animatedView.duration))
            Force: \(String(format: "%.2f", animatedView.force))
            Curve: \(animatedView.curve)
        """
    }

    private func setButtonText() {
        runAnimationButton.setTitle("Run \(animation[animationIndex].rawValue)", for: .normal)
    }
    
    private func randomNewParameters() {
        parameter.delay = Double.random(in: 0...1)
        parameter.duration = Double.random(in: 1...3)
        parameter.force = Double.random(in: 1...2)
    }
}


