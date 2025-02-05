/* 
   Project: test

   Author: User &

   Created: 2025-02-02 00:02:23 +0000 by garcia
   
   Application Controller
*/
 
#ifndef _PCAPPPROJ_APPCONTROLLER_H
#define _PCAPPPROJ_APPCONTROLLER_H

#import <AppKit/AppKit.h>
// Uncomment if your application is Renaissance-based
//#import <Renaissance/Renaissance.h>

#import "Button.h"
#import "Window.h"
#import "Text.h"
#import "Table.h"

@interface AppController : NSObject <NSApplicationDelegate>
{
  Window *mainWindow, *addWindow, *delWindow;
  Button *addButton, *delButton;
  Table *tab;
  NSTableColumn *col;
  NSRect rect;
}

+ (void)  initialize;

- (id) init;
- (void) dealloc;

- (void) awakeFromNib;

- (void) applicationDidFinishLaunching: (NSNotification *)aNotif;
- (BOOL) applicationShouldTerminate: (id)sender;
- (void) applicationWillTerminate: (NSNotification *)aNotif;
- (BOOL) application: (NSApplication *)application
	    openFile: (NSString *)fileName;

- (void) showPrefPanel: (id)sender;

@end

#endif
