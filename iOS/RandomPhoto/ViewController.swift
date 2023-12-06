//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Nicole Zhang on 2/12/2023.
//
import UIKit
import React
class ViewController: UIViewController {
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    } ()
    
    private let goButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Go to Module", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    } ()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        imageView.center = view.center
        
        view.addSubview(goButton)
        goButton.addTarget(self, action: #selector(didTapGoButton), for: .touchUpInside)
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        getRandomPhoto()
    }
    
    let colors:[UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGray,
        .systemYellow,
        .systemPurple,
        .systemCyan,
        .systemOrange
    ]
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    @IBAction func didTapGoButton(sender : UIButton) {
        NSLog("Hello")
          let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
          let mockData:NSDictionary = ["scores":
              [
                  ["name":"Alex", "value":"42"],
                  ["name":"Joel", "value":"10"]
              ]
          ]
          let rootView = RCTRootView(
              bundleURL: jsCodeLocation!,
              moduleName: "RNHighScores",
              initialProperties: mockData as [NSObject : AnyObject],
              launchOptions: nil
          )
          let vc = UIViewController()
          vc.view = rootView
          self.present(vc, animated: true, completion: nil)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 70,
                              y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                              width: view.frame.size.width-140,
                              height: 50)
        goButton.frame = CGRect(x: 70,
                                y: view.frame.size.height - 80 - view.safeAreaInsets.bottom,
                                width: view.frame.size.width-140,
                                height: 50)
    }
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600*600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}
