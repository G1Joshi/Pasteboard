//
//  ViewController.swift
//  Pasteboard
//
//  Created by Jeevan Chandra Joshi on 07/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textView: UITextView!

    let DATA = "data"
    var pastedStrings: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA) {
            pastedStrings.append(contentsOf: loadedStrings)
        }
        showText()
    }

    @IBAction func trashButton(_ sender: UIBarButtonItem) {
        pastedStrings.removeAll()
        UserDefaults.standard.removeObject(forKey: DATA)
        showText()
    }

    func addText() {
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text) else {
            return
        }
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: DATA)
        showText()
    }

    func showText() {
        textView.text = ""
        for str in pastedStrings {
            textView.text.append("\(str)\n\n")
        }
    }
}
