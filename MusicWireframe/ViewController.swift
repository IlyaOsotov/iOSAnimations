//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Илья Осотов on 20.01.2022.
//

import UIKit

class ViewController: UIViewController {
    var isPlaying: Bool = true {
        didSet {
            controlButton.isSelected = isPlaying
        }
    }
    
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var reverseBackground: UIView!
    @IBOutlet var controlBackground: UIView!
    @IBOutlet var forwardBackground: UIView!
    @IBOutlet var reverseButton: UIButton!
    @IBOutlet var controlButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case controlButton:
            buttonBackground = controlBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }

        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0.0
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            buttonBackground.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case controlButton:
            buttonBackground = controlBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @IBAction func reverseButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25, animations: {
            self.albumImageView.transform = CGAffineTransform(translationX: 5, y: 0)
        }) { (_) in
            self.albumImageView.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func controlButtonTapped(_ sender: UIButton) {
        isPlaying.toggle()
        
        if isPlaying {
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: [], animations: { self.albumImageView.transform = CGAffineTransform.identity }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [reverseBackground, controlBackground, forwardBackground].forEach { view in
            view?.layer.cornerRadius = view!.frame.height / 2
            view?.clipsToBounds = true
            view?.alpha = 0.0
        }
    }


}

