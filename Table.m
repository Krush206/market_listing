/*
   Project: Market Listing

   Copyright (C) 2025 Free Software Foundation

   Author: Matheus Garcia

   Created: 2025-02-17 16:19:42 +0000 by garcia

   This application is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This application is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.
*/

#import "AppController.h"

@implementation Table
- (void) delMenu {
  if([delWin isVisible] || [addWin isVisible] ||
  [[[NSNumber alloc] initWithInteger: itemName = [self selectedRow]] isLessThan: @0] ||
  [[[NSNumber alloc] initWithInteger: itemPrice = [self selectedRow]] isLessThan: @0])
    return;
  delWin = [Window window: @"Remove item" size: rect = NSMakeRect(0, 0, 350, 150) visible: YES];
  yBtn = [Button button: @"Remove" size: NSMakeRect(NSMaxX(rect) / 5, 10, 100, 25)];
  [yBtn setTarget: self];
  [yBtn setAction: @selector(del)];
  [[delWin contentView] addSubview: yBtn];
  nBtn = [Button button: @"Cancel" size: NSMakeRect(NSMaxX(rect) / 2, 10, 100, 25)];
  [nBtn setTarget: delWin];
  [nBtn setAction: @selector(close)];
  [[delWin contentView] addSubview: nBtn];
  txt = [[NSText alloc] initWithFrame: NSMakeRect(NSMaxX(rect) / 5, 100, 200, 20)];
  [txt setEditable: NO];
  [txt setDrawsBackground: NO];
  [txt setSelectable: NO];
  [txt setAlignment: NSTextAlignmentCenter];
  [txt setString: @"Are you sure?"];
  [[delWin contentView] addSubview: txt];
}

- (void) del {
  mutArrPrice = [[NSMutableArray alloc] initWithArray: [self arrPrice]];
  [mutArrPrice removeObjectAtIndex: itemPrice];
  [self setArrPrice: [[NSArray alloc] initWithArray: mutArrPrice]];
  mutArrName = [[NSMutableArray alloc] initWithArray: [self arrName]];
  [mutArrName removeObjectAtIndex: itemName];
  [self setArrName: [[NSArray alloc] initWithArray: mutArrName]];
  [self reloadData];
  [delWin close];
}

- (void) addMenu {
  if([addWin isVisible] || [delWin isVisible])
    return;
  addWin = [Window window: @"Add item" size: rect = NSMakeRect(0, 0, 350, 150) visible: YES];
  labName = [[Text alloc] initWithFrame: NSMakeRect(NSMaxX(rect) / 5, 100, 100, 20)];
  labPrice = [[Text alloc] initWithFrame: NSMakeRect(NSMaxX(rect) / 2, 100, 100, 20)];
  [labName setDelegate: labName];
  [labName setItemName: @""];
  [labPrice setDelegate: labPrice];
  [labPrice setItemPrice: @""];
  [[addWin contentView] addSubview: labName];
  [[addWin contentView] addSubview: labPrice];
  yBtn = [Button button: @"Add" size: NSMakeRect(NSMaxX(rect) / 5, 10, 100, 25)];
  [yBtn setTarget: self];
  [yBtn setAction: @selector(add)];
  [[addWin contentView] addSubview: yBtn];
  nBtn = [Button button: @"Cancel" size: NSMakeRect(NSMaxX(rect) / 2, 10, 100, 25)];
  [nBtn setTarget: addWin];
  [nBtn setAction: @selector(close)];
  [[addWin contentView] addSubview: nBtn];
}

- (void) add {
  if([[labName itemName] isEqualToString: @""] || [[labPrice itemPrice] isEqualToString: @""])
    return;
  if([[labPrice itemPrice] rangeOfString: @"^[0-9]*,[0-9]{2}$" options: NSRegularExpressionSearch].location == NSNotFound)
    return;
  [labPrice setItemPrice: [@"R$" stringByAppendingString: [labPrice itemPrice]]];
  mutArrPrice = [[NSMutableArray alloc] initWithArray: [self arrPrice]];
  [mutArrPrice addObject: [labPrice itemPrice]];
  [self setArrPrice: [[NSArray alloc] initWithArray: mutArrPrice]];
  mutArrName = [[NSMutableArray alloc] initWithArray: [self arrName]];
  [mutArrName addObject: [labName itemName]];
  [self setArrName: [[NSArray alloc] initWithArray: mutArrName]];
  [self reloadData];
}

- (NSInteger) numberOfRowsInTableView: (NSTableView *) tableView {
  if([[[NSNumber alloc] initWithInteger: [[self arrName] count]] isNotEqualTo: [[NSNumber alloc] initWithInteger: [[self arrPrice] count]]]) {
    NSLog(@"%@ doesn't equal %@'s count!", [self arrName], [self arrPrice]);
    return 0;
  }
  return [[self arrName] count];
}

- (id) tableView: (NSTableView *) tableView objectValueForTableColumn: (NSTableColumn *) tableColumn row: (NSInteger) row {
  if([[tableColumn identifier] isEqualToString: @"market"])
    return [[self arrName] objectAtIndex: row];
  return [[self arrPrice] objectAtIndex: row];
}
@end
