/* 
   Project: Market Listing

   Author: Matheus Garcia

   Created: 2025-02-02 00:02:23 +0000 by garcia
   
   Application Controller
*/
 
#ifndef _PCAPPPROJ_APPCONTROLLER_H
#define _PCAPPPROJ_APPCONTROLLER_H

#import <AppKit/AppKit.h>
// Uncomment if your application is Renaissance-based
//#import <Renaissance/Renaissance.h>

@interface Text : NSTextField <NSTextFieldDelegate>
{
  NSText *txtfld;
}
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *itemPrice;

- (BOOL) textShouldBeginEditing: (NSText *) textObject;
- (void) textDidChange: (NSNotification *) notif;
- (BOOL) textShouldEndEditing: (NSText *) textObject;
@end

@interface Button : NSButton
{
}

+ (instancetype) button: (NSString *) title size: (NSRect) rect;
@end

@interface Window : NSWindow <NSWindowDelegate>
{
}

+ (instancetype) window: (NSString *) title size: (NSRect) rect visible: (BOOL) visible;
- (BOOL) windowShouldClose: (id) sender;
@end

@interface Table : NSTableView <NSTableViewDataSource>
{
  Button *yBtn, *nBtn;
  Window *addWin, *delWin;
  Text *labName, *labPrice;
  NSText *txt;
  NSMutableArray *mutArrName, *mutArrPrice;
  NSRect rect;
  NSUInteger itemName, itemPrice;
  NSTableColumn *col;
  NSArray *arr;
}
@property (nonatomic, strong) NSArray *arrName;
@property (nonatomic, strong) NSArray *arrPrice;

- (NSInteger) numberOfRowsInTableView: (NSTableView *) tableView;
- (id) tableView: (NSTableView *) tableView objectValueForTableColumn: (NSTableColumn *) tableColumn row: (NSInteger) row;
@end

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
