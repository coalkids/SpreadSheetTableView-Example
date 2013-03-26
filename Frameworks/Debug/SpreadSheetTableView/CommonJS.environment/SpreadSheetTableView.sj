@STATIC;1.0;p;22;SpreadSheetTableView.jt;5525;@STATIC;1.0;I;20;AppKit/CPTableView.jt;5481;objj_executeFile("AppKit/CPTableView.j", NO);
//@global CPUpArrowFunctionKey
//@global CPDownArrowFunctionKey
//@global CPLeftArrowFunctionKey
//@global CPRightArrowFunctionKey
//@global CPTabKeyCode
//@global CPShiftKeyMask
var CPTableViewDelegate_tableView_shouldSelectRow_ = 1 << 9;
{var the_class = objj_allocateClassPair(CPTableView, "SpreadSheetTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_selectedColumIndex")]);


objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("selectedColumIndex"), function $SpreadSheetTableView__selectedColumIndex(self, _cmd)
{
return self._selectedColumIndex;
}
,["int"]), new objj_method(sel_getUid("setSelectedColumIndex:"), function $SpreadSheetTableView__setSelectedColumIndex_(self, _cmd, newValue)
{
self._selectedColumIndex = newValue;
}
,["void","int"]), new objj_method(sel_getUid("_init"), function $SpreadSheetTableView___init(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SpreadSheetTableView").super_class }, "_init");
    objj_msgSend(self, "setSelectionHighlightStyle:", CPTableViewSelectionHighlightStyleNone);
    objj_msgSend(self, "setAllowsMultipleSelection:", NO);
    self._selectedColumIndex = 0;
    var handlekeydown=function(e){
        if (e.keyCode == 9)
            objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
    }
    self._DOMElement.addEventListener('keydown',handlekeydown,NO);
}
,["void"]), new objj_method(sel_getUid("performKeyEquivalent:"), function $SpreadSheetTableView__performKeyEquivalent_(self, _cmd, anEvent)
{
    var character = objj_msgSend(anEvent, "charactersIgnoringModifiers"),
        modifierFlags = objj_msgSend(anEvent, "modifierFlags");
    if (character === CPUpArrowFunctionKey && modifierFlags == 0 || objj_msgSend(anEvent, "keyCode") == CPTabKeyCode && objj_msgSend(anEvent, "modifierFlags") & CPShiftKeyMask)
    {
        if (objj_msgSend(self, "selectedRow") == 0 || !objj_msgSend(self, "_shouldEditTableColumn:row:", objj_msgSend(objj_msgSend(self, "tableColumns"), "objectAtIndex:", self._selectedColumIndex), (objj_msgSend(self, "selectedRow") - 1)))
            return YES;
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
        objj_msgSend(self, "_moveSelectionWithEvent:upward:", anEvent, YES);
        objj_msgSend(self, "editColumn:row:withEvent:select:", self._selectedColumIndex, objj_msgSend(self, "selectedRow"), anEvent, YES);
        return YES;
    }
    if (character === CPDownArrowFunctionKey && modifierFlags == 0 || objj_msgSend(anEvent, "keyCode") == CPTabKeyCode)
    {
        if (objj_msgSend(self, "selectedRow") == objj_msgSend(self, "numberOfRows") - 1 || !objj_msgSend(self, "_shouldEditTableColumn:row:", objj_msgSend(objj_msgSend(self, "tableColumns"), "objectAtIndex:", self._selectedColumIndex), (objj_msgSend(self, "selectedRow") + 1)))
            return YES;
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
        objj_msgSend(self, "_moveSelectionWithEvent:upward:", anEvent, NO);
        objj_msgSend(self, "editColumn:row:withEvent:select:", self._selectedColumIndex, objj_msgSend(self, "selectedRow"), anEvent, YES);
        return YES;
    }
    if (character === CPLeftArrowFunctionKey && modifierFlags == 0)
    {
        if (self._selectedColumIndex == 0 || !objj_msgSend(self, "_shouldEditTableColumn:row:", objj_msgSend(objj_msgSend(self, "tableColumns"), "objectAtIndex:", (self._selectedColumIndex - 1)), objj_msgSend(self, "selectedRow")))
            return YES;
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
        self._selectedColumIndex = MAX(0,--self._selectedColumIndex);
        objj_msgSend(self, "editColumn:row:withEvent:select:", self._selectedColumIndex, objj_msgSend(self, "selectedRow"), anEvent, YES);
        return YES;
    }
    if (character === CPRightArrowFunctionKey && modifierFlags == 0)
    {
        if (self._selectedColumIndex == objj_msgSend(self, "numberOfColumns") - 1 || !objj_msgSend(self, "_shouldEditTableColumn:row:", objj_msgSend(objj_msgSend(self, "tableColumns"), "objectAtIndex:", (self._selectedColumIndex + 1)), objj_msgSend(self, "selectedRow")))
            return YES;
        objj_msgSend(objj_msgSend(self, "window"), "makeFirstResponder:", self);
        self._selectedColumIndex = MIN(objj_msgSend(self, "numberOfColumns") - 1, ++self._selectedColumIndex);
        objj_msgSend(self, "editColumn:row:withEvent:select:", self._selectedColumIndex, objj_msgSend(self, "selectedRow"), anEvent, YES);
        return YES;
    }
    return NO;
}
,["BOOL","CPEvent"]), new objj_method(sel_getUid("startTrackingAt:"), function $SpreadSheetTableView__startTrackingAt_(self, _cmd, aPoint)
{
    self._selectedColumIndex = objj_msgSend(self, "columnAtPoint:", aPoint);
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("SpreadSheetTableView").super_class }, "startTrackingAt:", aPoint);
}
,["BOOL","CGPoint"]), new objj_method(sel_getUid("_shouldEditTableColumn:row:"), function $SpreadSheetTableView___shouldEditTableColumn_row_(self, _cmd, aTableColumn, rowIndex)
{
    if (self._implementedDelegateMethods & CPTableViewDelegate_tableView_shouldSelectRow_)
        return objj_msgSend(self._delegate, "tableView:shouldEditTableColumn:row:", self, aTableColumn, rowIndex);
    return YES;
}
,["BOOL","CPTableColumn","int"])]);
}e;