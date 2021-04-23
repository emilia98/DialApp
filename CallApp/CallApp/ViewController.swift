//
//  ViewController.swift
//  CallApp
//
//  Created by Emilia Nedyalkova on 23.04.21.
//

import UIKit

class ViewController: UIViewController {
   // @IBOutlet var buttonsSubview: UIView!
    @IBOutlet var callButton: UIButton!
    @IBOutlet var buttonZero: UIButton!
    @IBOutlet var hashtagButton: UIButton!
    @IBOutlet var asteriskButton: UIButton!
    private var buttons: [ String: (attributed: Bool, mainText: String, secondaryText: String, target: UIButton)] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.buttons = [
            "0": (attributed: true, mainText: "0", secondaryText: "+", target: buttonZero)
        ]
        
        callButton.imageView?.contentMode = .scaleAspectFit
        callButton.clipsToBounds = true
        callButton.layer.cornerRadius = callButton.bounds.size.width * 0.5
        callButton.imageView?.contentMode = .scaleAspectFit
        
        buttonZero.clipsToBounds = true
        buttonZero.layer.cornerRadius = buttonZero.bounds.size.width * 0.5
        
        hashtagButton.clipsToBounds = true
        hashtagButton.layer.cornerRadius = hashtagButton.bounds.size.width * 0.5
        
        asteriskButton.clipsToBounds = true
        asteriskButton.layer.cornerRadius = asteriskButton.bounds.size.width * 0.5
        
        
        // callButton.se
        // buttonZero.titleLabel?.numberOfLines = 0
        
        // formatAttributedString("0")
        test("0")
    }
    
    private func formatAttributedString(_ key: String) {
        if !buttons[key]!.attributed {
            return
        }
        
        let buttonSettings = buttons[key]!
        let button = buttonSettings.target
        // button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        // let buttonText = "\(button.main)\n\()"
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        
        let fontMain = UIFont.systemFont(ofSize: 44)
        let attributesMain = [NSMutableAttributedString.Key.font: fontMain, .paragraphStyle: paragraph]
        let attributedTextMain = NSMutableAttributedString(string: buttonSettings.mainText, attributes: attributesMain)
        
        let fontSecondary = UIFont.systemFont(ofSize: 15)
        let attributesSecondary = [NSMutableAttributedString.Key.font: fontSecondary, .paragraphStyle: paragraph]
        let attributedTextSecondary = NSMutableAttributedString(string: buttonSettings.secondaryText, attributes: attributesSecondary)
        
        attributedTextMain.append(attributedTextSecondary)
        
        button.setAttributedTitle(attributedTextMain, for: [])
        button.titleLabel?.textAlignment = .center
    }
    
    
    private func test(_ key: String) {
        if !buttons[key]!.attributed {
            return
        }
        
        let buttonSettings = buttons[key]!
        let button = buttonSettings.target
        
        button.titleLabel?.textAlignment = .center
        
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
          let buttonText: NSString = "0\n+"
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center

          //getting the range to separate the button title strings
          let newlineRange: NSRange = buttonText.range(of: "\n")

          //getting both substrings
          var substring1 = ""
          var substring2 = ""

          if(newlineRange.location != NSNotFound) {
              substring1 = buttonText.substring(to: newlineRange.location)
              substring2 = buttonText.substring(from: newlineRange.location)
          }

          //assigning diffrent fonts to both substrings
          let font1: UIFont = UIFont(name: "Arial", size: 44)!
        let attributes1 = [NSMutableAttributedString.Key.font: font1, .paragraphStyle: paragraph]
          let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)

          let font2: UIFont = UIFont(name: "Arial", size: 18)!
        let attributes2 = [NSMutableAttributedString.Key.font: font2, .paragraphStyle: paragraph]
          let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)

          //appending both attributed strings
          attrString1.append(attrString2)

          //assigning the resultant attributed strings to the button
        button.setAttributedTitle(attrString1, for: [])
    }


}

/*
 let buttonText: NSString = "hello\nthere"

 //getting the range to separate the button title strings
 let newlineRange: NSRange = buttonText.range(of: "\n")

 //getting both substrings
 var substring1 = ""
 var substring2 = ""

 if(newlineRange.location != NSNotFound) {
     substring1 = buttonText.substring(to: newlineRange.location)
     substring2 = buttonText.substring(from: newlineRange.location)
 }

 //assigning diffrent fonts to both substrings
 let font1: UIFont = UIFont(name: "Arial", size: 17.0)!
 let attributes1 = [NSMutableAttributedString.Key.font: font1]
 let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)

 let font2: UIFont = UIFont(name: "Arial", size: 11.0)!
 let attributes2 = [NSMutableAttributedString.Key.font: font2]
 let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)

 //appending both attributed strings
 attrString1.append(attrString2)

 //assigning the resultant attributed strings to the button
 textResponseButton?.setAttributedTitle(attrString1, for: [])
 */
