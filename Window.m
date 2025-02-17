/*
   Project: Market Listing

   Copyright (C) 2025 Free Software Foundation

   Author: Matheus Garcia

   Created: 2025-02-17 16:19:47 +0000 by garcia

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
