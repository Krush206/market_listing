/* 
   Project: test

   Author: User &

   Created: 2025-02-02 00:02:23 +0000 by garcia
   
   Application Controller
*/

#import "AppController.h"

@implementation AppController

+ (void) initialize
{
  NSMutableDictionary *defaults = [NSMutableDictionary dictionary];

  /*
   * Register your app's defaults here by adding objects to the
   * dictionary, eg
   *
   * [defaults setObject:anObject forKey:keyForThatObject];
   *
   */
  
  [[NSUserDefaults standardUserDefaults] registerDefaults: defaults];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id) init
{
  if ((self = [super init]))
    [NSApp setDelegate: NSApp];
  return self;
}

- (void) dealloc
{
  [super dealloc];
}

- (void) awakeFromNib
{
}

- (void) applicationDidFinishLaunching: (NSNotification *)aNotif
{
// Uncomment if your application is Renaissance-based
//  [NSBundle loadGSMarkupNamed: @"Main" owner: self];
  mainWindow = [Window window: @"Market listing" size: rect = NSMakeRect(0, 0, 150, 350) visible: YES];
  [[mainWindow contentView] setIdentifier: @"market"];
  [mainWindow makeMainWindow];
  tab = [[Table alloc] initWithFrame: rect = NSMakeRect(NSMaxX(rect) / 6, 50, 200, 200)];
  [tab addTableColumn: col = [[NSTableColumn alloc] initWithIdentifier: @"market"]];
  [col setEditable: NO];
  [tab setAlignment: NSTextAlignmentJustified];
  [tab setArr: [NSArray new]];
  [tab setDataSource: tab];
  [[mainWindow contentView] addSubview: tab];
  addButton = [Button button: @"Add" size: NSMakeRect(NSMaxX(rect) / 6, 300, 90, 25)];
  [addButton setTarget: tab];
  [addButton setAction: @selector(addMenu)];
  [[mainWindow contentView] addSubview: addButton];
  delButton = [Button button: @"Remove" size: NSMakeRect(NSMaxX(rect) / 6, 250, 90, 25)];
  [delButton setTarget: tab];
  [delButton setAction: @selector(delMenu)];
  [[mainWindow contentView] addSubview: delButton];
}

- (void) applicationDidUpdate: (NSNotification *) notif {
}

- (BOOL) applicationShouldTerminate: (id)sender
{
  
  return YES;
}

- (void) applicationWillTerminate: (NSNotification *)aNotif
{
}

- (BOOL) application: (NSApplication *)application
	    openFile: (NSString *)fileName
{
  return NO;
}

- (void) showPrefPanel: (id)sender
{
}

@end

@implementation Window
+ (instancetype) window: (NSString *) title size: (NSRect) rect visible: (BOOL) visible {
  Window *window;
  
  window = [[super alloc] initWithContentRect: rect styleMask: NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing: NSBackingStoreBuffered defer: NO];
  [window setTitle: title];
  [window center];
  [window setIsVisible: visible];
  [window setDelegate: window];
  
  return window;
}

- (BOOL) windowShouldClose: (id) sender {
  NSString *ident;
  
  if((ident = [[sender contentView] identifier]) != nil &&
     [ident isEqualToString: @"market"])
    [NSApp terminate: sender];
  return YES;
}
@end

@implementation Button
+ (instancetype) button: (NSString *) title size: (NSRect) rect {
  Button *button;
  
  button = [[super alloc] initWithFrame: rect];
  [button setTitle: title];
  
  return button;
}
@end

@implementation Table
- (void) delMenu {
  if([delWin isVisible] || [addWin isVisible] || [[[NSNumber alloc] initWithInteger: item = [self selectedRow]] isLessThan: @0])
    return;
  delWin = [Window window: @"Remove item" size: NSMakeRect(0, 0, 350, 150) visible: YES];
  yBtn = [Button button: @"Remove" size: rect = NSMakeRect(90, 10, 90, 25)];
  [yBtn setTarget: self];
  [yBtn setAction: @selector(del)];
  [[delWin contentView] addSubview: yBtn];
  nBtn = [Button button: @"Cancel" size: NSMakeRect(NSMaxX(rect), 10, 90, 25)];
  [nBtn setTarget: delWin];
  [nBtn setAction: @selector(close)];
  [[delWin contentView] addSubview: nBtn];
  txt = [[Text alloc] initWithFrame: NSMakeRect(NSMaxX(rect) - 50, 100, 150, 20)];
  [txt setEditable: NO];
  [txt setBezeled: NO];
  [txt setDrawsBackground: NO];
  [txt setSelectable: NO];
  [txt setStringValue: @"Are you sure?"];
  [[delWin contentView] addSubview: txt];
}

- (void) del {
  mutarr = [[NSMutableArray alloc] initWithArray: [self arr]];
  [mutarr removeObjectAtIndex: item];
  [self setArr: [[NSArray alloc] initWithArray: mutarr]];
  [self reloadData];
  [delWin close];
}

- (void) addMenu {
  if([addWin isVisible] || [delWin isVisible])
    return;
  addWin = [Window window: @"Add item" size: NSMakeRect(0, 0, 350, 150) visible: YES];
  lab = [[Text alloc] initWithFrame: NSMakeRect(100, 100, 150, 20)];
  [lab setDelegate: lab];
  [lab setItem: @""];
  [[addWin contentView] addSubview: lab];
  yBtn = [Button button: @"Add" size: rect = NSMakeRect(90, 10, 90, 25)];
  [yBtn setTarget: self];
  [yBtn setAction: @selector(add)];
  [[addWin contentView] addSubview: yBtn];
  nBtn = [Button button: @"Cancel" size: NSMakeRect(NSMaxX(rect), 10, 90, 25)];
  [nBtn setTarget: addWin];
  [nBtn setAction: @selector(close)];
  [[addWin contentView] addSubview: nBtn];
}

- (void) add {
  if([[lab item] isEqualToString: @""])
    return;
  mutarr = [[NSMutableArray alloc] initWithArray: [self arr]];
  [mutarr addObject: [lab item]];
  [self setArr: [[NSArray alloc] initWithArray: mutarr]];
  [self reloadData];
}

- (NSInteger) numberOfRowsInTableView: (NSTableView *) tableView {
  return [[self arr] count];
}

- (id) tableView: (NSTableView *) tableView objectValueForTableColumn: (NSTableColumn *) tableColumn row: (NSInteger) row {
  return [[self arr] objectAtIndex: row];
}
@end

@implementation Text

- (BOOL) textShouldBeginEditing: (NSText *) textObject {
  txtfld = textObject;
  return YES;
}

- (void) textDidChange: (NSNotification *) notif {
  [self setItem: [[txtfld string] copy]];
}

- (BOOL) textShouldEndEditing: (NSText *) textObject {
  return NO;
}
@end
