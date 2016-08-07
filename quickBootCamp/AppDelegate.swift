//
//  AppDelegate.swift
//  quickBootCamp
//
//  Created by 김상현 on 2016. 8. 6..
//  Copyright © 2016년 orcacode. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
    
    @IBAction func bootcampClicked(sender: NSMenuItem) {
        NSAppleScript(source: "do shell script \"sudo bless -mount /Volumes/BOOTCAMP -legacy -setBoot -nextonly; sudo shutdown -r now\" with administrator " +
            "privileges")!.executeAndReturnError(nil)
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        statusItem.menu = statusMenu
        
        let menuIcon = NSImage(named: "BootCamp")
        menuIcon?.template = true
        statusItem.image = menuIcon
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}

