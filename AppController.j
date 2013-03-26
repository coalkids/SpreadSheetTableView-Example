/*
 * AppController.j
 * SpreadSheetCapp
 *
 * Created by Alexandre Wilhelm on March 21, 2013.
 * Copyright 2013, Coalkods
 */

@import <Foundation/CPObject.j>
@import <SpreadSheetTableView/SpreadSheetTableView.j>

@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    @outlet SpreadSheetTableView spreadSheetTableView;

    int i;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
    i = 0;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
}

@end

@implementation AppController (TableViewDelegate)

- (int)numberOfRowsInTableView:(CPTableView)aTableView
{
    return 15;
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aColumn row:(int)aRowIndex
{
    if ([[aColumn identifier] isEqualToString:@"Column1"])
        return aRowIndex;

    if ([[aColumn identifier] isEqualToString:@"Column2"])
        return aRowIndex * 2;

    return aRowIndex * 3;
}

- (BOOL)tableView:(CPTableView)aTableView shouldEditTableColumn:(CPTableColumn)aTableColumn row:(int)rowIndex
{
    if ([[aTableColumn identifier] isEqualToString:@"Column3"])
    {
        console.log("We don't want to edit the column 3")
        return NO;
    }

    return YES;
}

- (void)tableView:(CPTableView)aTableView setObjectValue:(id)anObject forTableColumn:(CPTableColumn)aTableColumn row:(int)rowIndex
{
    console.log("Object editing : " + anObject);
}

@end