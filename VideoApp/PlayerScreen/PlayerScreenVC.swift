//
//  PlayerScreenVC.swift
//  VideoApp
//
//  Created by Shubham Tunwal on 13/12/20.
//

import UIKit

class PlayerScreenVC: UIViewController {

    
    var category:String?
    var videos:[Node]?
    var position:Int?
    
    @IBOutlet weak var playerView: VideoView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadVideo()
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .up {
            if(position! < videos!.count-1){
                position! += 1
                loadVideo()
            }else{
                showToast(message: "No more Videos", font: .systemFont(ofSize: 12.0))
            }
        }
        else if gesture.direction == .down {
            if(position! > 0){
                position! -= 1
                loadVideo()
            }else{
                showToast(message: "No more Videos", font: .systemFont(ofSize: 12.0))
            }
        }else if gesture.direction == .right {
            self.modalTransitionStyle = .flipHorizontal
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    func loadVideo(){
        playerView.configure(url: videos![position!].video.encodeURL)
        playerView.isLoop = true
        playerView.play()
    }

    @IBAction func back(_ sender: Any) {
        self.modalTransitionStyle = .flipHorizontal
        self.dismiss(animated: true, completion: nil)
    }
    
}
