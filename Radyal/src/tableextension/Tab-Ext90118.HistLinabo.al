/// <summary>
/// TableExtension HistLinvta (ID 90116) extends Record Sales Invoice Line.
/// </summary>
tableextension 90118 HistLinabo extends "Sales Cr.Memo Line"
{
    fields
    {
        field(85002; "Situación inmueble"; Code[10]) { }
        field(85003; "Referencia catastral"; Text[30]) { }
        field(85000; "Linea Retencion"; Boolean) { }
        field(85001; "Sujeto IRPF"; Boolean) { }


    }
}
