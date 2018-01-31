DefinitionBlock("", "SSDT", 2, "hack", "DGPU", 0)
{
    External(_SB.PCI0.RP05.PEGP._OFF, MethodObj)
    External(_SB.PCI0.RP05.PEGP.XINI, MethodObj)
    Method(_SB.PCI0.RP05.PEGP._INI)
    {
        XINI()
        _OFF()
    }
}