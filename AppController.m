/* 
   Project: Market Listing

   Author: Matheus Garcia

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
  mainWindow = [Window window: @"Market listing" size: rect = NSMakeRect(0, 0, 250, 350) visible: YES];
  [[mainWindow contentView] setIdentifier: @"market"];
  [mainWindow makeMainWindow];
  tab = [[Table alloc] initWithFrame: NSMakeRect(NSMaxX(rect) / 10, 50, 200, 200)];
  [tab addTableColumn: col = [[NSTableColumn alloc] initWithIdentifier: @"market"]];
  [col setEditable: NO];
  [tab addTableColumn: col = [[NSTableColumn alloc] initWithIdentifier: @"price"]];
  [col setEditable: NO];
  [tab setAlignment: NSTextAlignmentJustified];
  [tab setArrName: [NSArray new]];
  [tab setArrPrice: [NSArray new]];
  [tab setDataSource: tab];
  [[mainWindow contentView] addSubview: tab];
  addButton = [Button button: @"Add" size: NSMakeRect(NSMaxX(rect) / 5, 300, 150, 25)];
  [addButton setTarget: tab];
  [addButton setAction: @selector(addMenu)];
  [[mainWindow contentView] addSubview: addButton];
  delButton = [Button button: @"Remove" size: NSMakeRect(NSMaxX(rect) / 5, 250, 150, 25)];
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
