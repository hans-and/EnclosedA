(*
Thanks to http: //stackoverflow.com/users/505088/david-heffernan
*)
unit Sender;
interface
uses
  windows;

procedure SendAlt24B6;

implementation

procedure SendAlt24B6;
var
  KeyInputs: array of TInput;
  procedure KeybdInput(VKey: Byte; Flags: DWORD);
  begin
    SetLength(KeyInputs, Length(KeyInputs) + 1);
    KeyInputs[high(KeyInputs)].Itype := INPUT_KEYBOARD;

    with KeyInputs[high(KeyInputs)].ki do
    begin
      wVk := VKey;
      wScan := MapVirtualKey(wVk, 0);
      dwFlags := Flags;
    end;
  end; begin KeybdInput(VK_MENU, 0);

  KeybdInput($6B, 0);
  KeybdInput($6B, KEYEVENTF_KEYUP);

  KeybdInput(Ord('2'), 0);
  KeybdInput(Ord('2'), KEYEVENTF_KEYUP);

  KeybdInput(Ord('4'), 0);
  KeybdInput(Ord('4'), KEYEVENTF_KEYUP);

  KeybdInput(Ord('B'), 0);
  KeybdInput(Ord('B'), KEYEVENTF_KEYUP);

  KeybdInput(Ord('6'), 0);
  KeybdInput(Ord('6'), KEYEVENTF_KEYUP);

  KeybdInput(VK_MENU, KEYEVENTF_KEYUP);

  SendInput(Length(KeyInputs), KeyInputs[0], SizeOf(KeyInputs[0]));
end;
end.

