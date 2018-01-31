DefinitionBlock("", "SSDT", 2, "hack", "BATT", 0)
{   
    External(_SB, DeviceObj)
    External(_SB.BAT0, DeviceObj)
    External(_SB.PCI0, DeviceObj)
    External(_SB.PCI0.LPCB, DeviceObj)
    External(_SB.PCI0.LPCB.EC0, DeviceObj)
    External(_SB.PCI0.LPCB.EC0.MUT0, MutexObj)
    External(_SB.PCI0.LPCB.EC0.DNN0, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.BCN0, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.MNN0, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.B0DC, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.B0IC, FieldUnitObj)
    External(_SB.PCI0.LPCB.EC0.B0CL, FieldUnitObj)
    External(_SB.BAT0.PAK0, PkgObj)
    External(_SB.BAT0.ITOS, MethodObj)
    External(_SB.BAT0.BFB0, PkgObj)
    External(PWRS, FieldUnitObj)

    Method (B1B2, 2, NotSerialized) { Return(Or(Arg0, ShiftLeft(Arg1, 8))) }

    //Patched Methods
    Scope(_SB)
    {
        Scope(PCI0.LPCB.EC0)
        {
            OperationRegion (XCRM, EmbeddedControl, Zero, 0x0100)
            Field(XCRM, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                AP00,8,AP01,8, //accessed
                /*RCP0*/,   16, 
                OT00,8,OT01,8, //accessed
                RT00,8,RT01,8, //accessed
                /*BTM0*/,   16, 
                /*BST0*/,   16, 
                /*BRC0*/,   16, 
                CP00,8,CP01,8, //accessed
                DC00,8,DC01,8, //accessed
                DV00,8,DV01,8, //accessed
                /*MER0*/,   16, 
                /*MFD0*/,   16, 
                SN00,8,SN01,8, //accessed
            }
        }

        Scope(BAT0)
        {
            
            Method (_BIF, 0, Serialized)  // _BIF: Battery Information
            {
                Name (_T_2, Zero)  // _T_x: Emitted by ASL Compiler
                Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                Store ("BIF0", Debug)
                Acquire (^^PCI0.LPCB.EC0.MUT0, 0xFFFF)
                Store (B1B2(^^PCI0.LPCB.EC0.DC00,^^PCI0.LPCB.EC0.DC01), Index (PAK0, One))
                Store (B1B2(^^PCI0.LPCB.EC0.CP00,^^PCI0.LPCB.EC0.CP01), Local0)
                Store (Local0, Index (PAK0, 0x02))
                Store (B1B2(^^PCI0.LPCB.EC0.DV00,^^PCI0.LPCB.EC0.DV01), Index (PAK0, 0x04))
                Store (^^PCI0.LPCB.EC0.DNN0, Local1)
                Store (B1B2(^^PCI0.LPCB.EC0.SN00,^^PCI0.LPCB.EC0.SN01), Local2)
                Store (^^PCI0.LPCB.EC0.BCN0, Local3)
                Store (^^PCI0.LPCB.EC0.MNN0, Local4)
                Release (^^PCI0.LPCB.EC0.MUT0)
                Store (Divide (Local0, 0x0A, ), Index (PAK0, 0x05))
                Store (Zero, Index (PAK0, 0x06))
                While (One)
                {
                    Store (ToInteger (Local1), _T_0)
                    If (LEqual (_T_0, Zero))
                    {
                        Store ("Unknow", Index (PAK0, 0x09))
                    }
                    ElseIf (LEqual (_T_0, 0xFF))
                    {
                        Store ("Dell", Index (PAK0, 0x09))
                    }

                    Break
                }

                Store (ITOS (ToBCD (Local2)), Index (PAK0, 0x0A))
                While (One)
                {
                    Store (ToInteger (Local3), _T_1)
                    If (LEqual (_T_1, Zero))
                    {
                        Store ("Unknow", Index (PAK0, 0x0B))
                    }
                    ElseIf (LEqual (_T_1, One))
                    {
                        Store ("PBAC", Index (PAK0, 0x0B))
                    }
                    ElseIf (LEqual (_T_1, 0x02))
                    {
                        Store ("LION", Index (PAK0, 0x0B))
                    }
                    ElseIf (LEqual (_T_1, 0x03))
                    {
                        Store ("NICD", Index (PAK0, 0x0B))
                    }
                    ElseIf (LEqual (_T_1, 0x04))
                    {
                        Store ("NIMH", Index (PAK0, 0x0B))
                    }
                    ElseIf (LEqual (_T_1, 0x05))
                    {
                        Store ("NIZN", Index (PAK0, 0x0B))
                    }
                    ElseIf (LEqual (_T_1, 0x06))
                    {
                        Store ("RAM", Index (PAK0, 0x0B))
                    }
                    ElseIf (LEqual (_T_1, 0x07))
                    {
                        Store ("ZNAR", Index (PAK0, 0x0B))
                    }
                    ElseIf (LEqual (_T_1, 0x08))
                    {
                        Store ("LIP", Index (PAK0, 0x0B))
                    }

                    Break
                }

                While (One)
                {
                    Store (ToInteger (Local4), _T_2)
                    If (LEqual (_T_2, Zero))
                    {
                        Store ("Unknow", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, One))
                    {
                        Store ("Dell", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, 0x02))
                    {
                        Store ("SONY", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, 0x03))
                    {
                        Store ("SANYO", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, 0x04))
                    {
                        Store ("PANASONIC", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, 0x05))
                    {
                        Store ("SONY_OLD", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, 0x06))
                    {
                        Store ("SDI", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, 0x07))
                    {
                        Store ("SIMPLO", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, 0x08))
                    {
                        Store ("MOTOROLA", Index (PAK0, 0x0C))
                    }
                    ElseIf (LEqual (_T_2, 0x09))
                    {
                        Store ("LGC", Index (PAK0, 0x0C))
                    }

                    Break
                }

                Return (PAK0)
            }
            
            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Acquire (^^PCI0.LPCB.EC0.MUT0, 0xFFFF)
                Store (^^PCI0.LPCB.EC0.B0DC, Local0)
                Store (^^PCI0.LPCB.EC0.B0IC, Local1)
                ShiftLeft (Local1, One, Local1)
                Add (Local0, Local1, Local0)
                Store (^^PCI0.LPCB.EC0.B0CL, Local1)
                Release (^^PCI0.LPCB.EC0.MUT0)
                ShiftLeft (Local1, 0x02, Local1)
                Add (Local0, Local1, Local0)
                Store (Local0, Index (BFB0, Zero))
                Acquire (^^PCI0.LPCB.EC0.MUT0, 0xFFFF)
                Store (B1B2(^^PCI0.LPCB.EC0.AP00,^^PCI0.LPCB.EC0.AP01), Index (BFB0, 0x02))
                Store (B1B2(^^PCI0.LPCB.EC0.OT00,^^PCI0.LPCB.EC0.OT01), Index (BFB0, 0x03))
                Release (^^PCI0.LPCB.EC0.MUT0)
                Acquire (^^PCI0.LPCB.EC0.MUT0, 0xFFFF)
                Store (B1B2(^^PCI0.LPCB.EC0.RT00,^^PCI0.LPCB.EC0.RT01), Local0)
                Release (^^PCI0.LPCB.EC0.MUT0)
                If (LEqual (Local0, Zero))
                {
                    Increment (Local0)
                }
                ElseIf (PWRS)
                {
                    If (And (Local0, 0x8000))
                    {
                        Store (Ones, Local0)
                    }
                }
                ElseIf (And (Local0, 0x8000))
                {
                    Subtract (Zero, Local0, Local0)
                    And (Local0, 0xFFFF, Local0)
                }
                Else
                {
                    Store (Ones, Local0)
                }

                Store (Local0, Index (BFB0, One))
                Return (BFB0)
            }
        }
    }
}